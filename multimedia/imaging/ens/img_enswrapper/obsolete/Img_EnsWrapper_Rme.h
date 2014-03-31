/*
* Copyright (C) ST-Ericsson SA 2010. All rights reserved.
* This code is ST-Ericsson proprietary and confidential.
* Any use of the code for whatever purpose is subject to
* specific written permission of ST-Ericsson SA.
*/

/*
* \file    Img_EnsWrapper_Rme.h
* \brief   Define the types and classes nedded to connect the ENS wrapper to the RME service
*  as thread based execution model requires to aquire the wrapper lock when RME is calling the
*  OMX component callbacks. For this we need to associate a RME callback structure to each
*  wrapper passing this structure to the RME to be able to acquire the lock when RME willing
*  to call the ENS callback.
*/
#ifndef _IMG_ENSWRAPPER_RME_H_
#define _IMG_ENSWRAPPER_RME_H_

//#include "Img_EnsHwRm.h"
//#include "Img_EnsQueue.h"
//
//extern "C" {
//#include <los/api/los_api.h>
//}

/********************************************************************************
* Component to RME message types definitions
********************************************************************************/

/**
* Component to RME message types definition
*/
typedef enum {
	MSG_CMP2RME_Notify_NewStatesOMXRES,
	MSG_CMP2RME_Notify_NewPolicyCfg,
	MSG_CMP2RME_Notify_RMConfigApplied,
	MSG_CMP2RME_Notify_Tunnel,
	MSG_CMP2RME_Notify_ESRAM_Sharing,
	MSG_CMP2RME_Request_Thread_Exit,
} CMP2RME_MessageType;

/**
* Component to RME message arguments structure definition
*/
typedef struct {
	CMP2RME_MessageType type;
	OMX_PTR pCompHdl;
	union
	{
		struct {
			OMX_STATETYPE eOMXILState;
			RM_RESOURCESTATE_E eResourceState;
			OMX_U32 nCounter;
		} sNotify_NewStatesOMXRES;
		struct {
			OMX_U32 nGroupPriority;
			OMX_U32 nGroupID;
			OMX_U32 eQoSbitmap;
		} sNotify_NewPolicyCfg;
		struct {
			RM_RC_E eType;
			OMX_U32 nData;
			RM_STATUS_E nErrorCode;
		} sNotify_RMConfigApplied;
		struct {
			OMX_U32 nPortIndexOut;
			OMX_PTR pCompHdlIn;
			OMX_U32 nPortIndexIn;
		} sNotify_Tunnel;
		struct {
			OMX_BOOL bEsramResourceRequired;
		} sNotify_ESRAM_Sharing;
	} args;
} CMP2RME_Message;


/********************************************************************************
* RME to Component callbacks message types definitions
********************************************************************************/

typedef enum {
	MSG_RME2CMP_CP_Notify_Error,
	MSG_RME2CMP_CP_Notify_ResReservationProcessed,
	MSG_RME2CMP_CP_Cmd_SetRMConfig,
	MSG_RME2CMP_CP_Cmd_ReleaseResource,
	MSG_RME2CMP_Request_Thread_Exit,
} RME2CMP_MessageType;

typedef struct
{
	RME2CMP_MessageType type;
	OMX_PTR pCompHdl;
	union
	{
		struct {
			RM_STATUS_E nError;
		} CP_Notify_Error;
		struct {
			OMX_BOOL bResourcesReservGranted;
		} CP_Notify_ResReservationProcessed;
		struct {
			RM_SYSCTL_T sRMcfg;
		} CP_Cmd_SetRMConfig;
		struct {
			OMX_BOOL bSuspend;
		} CP_Cmd_ReleaseResource;
	} args;
} RME2CMP_Message;


#define IMG_RME_MESSAGE_ARRAY_SIZE 128
#define IMG_RME_THREAD_STACK_SIZE (32*1024)

// class RME;

class Img_EnsWrapper_Rme
{
protected:
	/** Preallocated CMP2RME messages  */
	CMP2RME_Message mCMP2RME_MessageArray[IMG_RME_MESSAGE_ARRAY_SIZE];
	/** The CMP2RME free messages list */
	Img_EnsQueue mCMP2RMEfreeMsgList;
	/** The pending messages list to be processed by the RME thread  */
	Img_EnsQueue pendingCMP2RMEmsgList;
	/** The semaphore to notify RME thread of new messages  */
	t_osal_sem_id m_Semaphore_ComponentToRme;


	/** Preallocated RME2CMP messages  */
	RME2CMP_Message mRME2CMP_MessageArray[IMG_RME_MESSAGE_ARRAY_SIZE];
	/** The RME2CMP free messages list */
	Img_EnsQueue mRME2CMPfreeMsgList;
	/** The pending messages list to be processed by the RME thread  */
	Img_EnsQueue pendingRME2CMPmsgList;
	/** The semaphore to notify RME thread of new messages  */
	t_osal_sem_id RME2CMP_semaphore;


	/* The RME instance */
	RME* mRME;
	/** The unique RME wrapper instance  */
	static Img_EnsWrapper_Rme * rmeWrapper;
	/** start the RME thread */
	void startRMEthread();
	/** start the RME Call Back thread */
	void startRMECallBackThread();

public:
	Img_EnsWrapper_Rme();
	~Img_EnsWrapper_Rme();

	/** Get the single instance of the ENS RME wrapper  */
	static Img_EnsWrapper_Rme * getInstance();

	static void RME_ThreadEntry(void *); /** The RME thread entry function  */
	static void RMECallBack_ThreadEntry(void *);/** The RME Call back thread entry function  */

	/********************************************************************************/

	RM_STATUS_E RME_Register  (OMX_IN const OMX_PTR pCompHdl, OMX_IN const RM_CBK_T* pCompCbks);
	RM_STATUS_E RME_Unregister(OMX_IN const OMX_PTR pCompHdl);
	OMX_U32 RME_Get_DefaultDDRDomain(OMX_IN RM_NMFD_E nDomainType);

	/********************************************************************************/

	CMP2RME_Message * getFreeCMP2RMEmsg();      /** Retreive a CMP2RME message container */
	void putFreeCMP2RMEmsg(CMP2RME_Message *); /** Put back to free the message container */


	void postCMP2RMEmsg(CMP2RME_Message *);     /** Post a message to be process by the RME */
	CMP2RME_Message * popCMP2RMEmsg();          /** Post a message to be process by the RME */

	int getNbPendingCMP2RME() const { return pendingCMP2RMEmsgList.nbElem(); }; /* Return the number of pending CMP to RME messages */

	/********************************************************************************/

	/** Retreive a RME2CMP message container */
	RME2CMP_Message * getFreeRME2CMPmsg();
	/** Put back to free the message container */
	void putFreeRME2CMPmsg(RME2CMP_Message *);

	/** Post a message to be process by the RME */
	void postRME2CMPmsg(RME2CMP_Message *);
	/** Post a message to be process by the RME */
	RME2CMP_Message * popRME2CMPmsg();

	/** Kill single instance of the ENS RME wrapper  */
	static void delInstance();

	/** The number of OMX components regsitered to RME
	when reaching 0 we cleanup the RME and associated */
	volatile int refCount;
	/** The semaphore to notify OMX thread that RME thread has exited */
	t_osal_sem_id m_Semaphore_RmeExit;
	/** The semaphore to notify OMX thread that RME CallBack thread has exited */
	t_osal_sem_id m_Semaphore_RmeCallbackExit;
};


#endif /* _IMG_ENSWRAPPER_RME_H_ */

/*
 * Copyright (C) ST-Ericsson SA 2010. All rights reserved.
 * This code is ST-Ericsson proprietary and confidential.
 * Any use of the code for whatever purpose is subject to
 * specific written permission of ST-Ericsson SA.
 */

/*
    File:     nmxAawbFunctions.h
    Author:   Luigi Arnone (luigi.arnone@stericsson.com)  
    Created:  Fri Sep 30 18:52:12 2011
    Purpose:  This file is automatically produced
              In this file there are all function prototype of nmx library

    COPYRIGHT: This program is property of STEricsson Image Quality Team Agrate
*/

#ifndef H_nmxAawbFunctions
#define H_nmxAawbFunctions 1

extern nmxRCode_t nmxAawbClassifier_u8d(nmxMatrix *grid,uint8_t isLog,nmxMatrix *ctxPdf,nmxMatrix *IllClassesLikelihood,nmxMatrix *SurfsLikelihood,nmxMatrix *sensorLogTilts,nmxMatrix *ChromaticityTable,nmxMatrix *SqrSigmaTableInv,nmxMatrix *SurfsIsReflectance,nmxMatrix *IllsLocusIdx,nmxMatrix *IllsLogGainPair,nmxMatrix *LocusLogGainPairs,double ChannelLowThrValue,double ClipHighThrPercent,double MaxAdaptiveCorrectionPercent,double SubsamplingFactor,double CornerSignificance,nmxMatrix *SkyPdf,double SkyLocusCoord,nmxMatrix *LocusWeights,nmxMatrix *LogTable,nmxMatrix *LocusCoordRange,nmxMatrix *AwbGains,nmxMatrix *EstimatedPdf,nmxMatrix *SurfMap,nmxMatrix *LocusCoordMap,nmxMatrix *IllClassMap,nmxMatrix *ScoreMap,nmxMatrix *ChromaticityMap,nmxMatrix *SurfLocusHistogram,nmxMatrix *SurfDiscreteHistogram,nmxMatrix *BestSurfLocusHistogram,nmxMatrix *BestSurfLocusHistogramSum,nmxMatrix *BestSurfDiscreteHistogram,nmxMatrix *SurfLocusChroma,nmxMatrix *SurfClassChromaDiff,nmxMatrix *SurfClassChromaSqrDiff,nmxMatrix *SurfClassChromaFactor,nmxMatrix *SurfTargetClassChroma,nmxMatrix *SurfCombWeights,nmxMatrix *SurfsTotalScore,nmxMatrix *SurfsArea,nmxMatrix *IllClassesScore,nmxMatrix *CorrectionRbGains,nmxMatrix *NominalRbGains,nmxMatrix *ThreeHypothesis,nmxMatrix *LocusCoordResult,nmxMatrix *Locus10);
extern nmxRCode_t nmxAawbClassifier_u8f(nmxMatrix *grid,uint8_t isLog,nmxMatrix *ctxPdf,nmxMatrix *IllClassesLikelihood,nmxMatrix *SurfsLikelihood,nmxMatrix *sensorLogTilts,nmxMatrix *ChromaticityTable,nmxMatrix *SqrSigmaTableInv,nmxMatrix *SurfsIsReflectance,nmxMatrix *IllsLocusIdx,nmxMatrix *IllsLogGainPair,nmxMatrix *LocusLogGainPairs,float ChannelLowThrValue,float ClipHighThrPercent,float MaxAdaptiveCorrectionPercent,float SubsamplingFactor,float CornerSignificance,nmxMatrix *SkyPdf,float SkyLocusCoord,nmxMatrix *LocusWeights,nmxMatrix *LogTable,nmxMatrix *LocusCoordRange,nmxMatrix *AwbGains,nmxMatrix *EstimatedPdf,nmxMatrix *SurfMap,nmxMatrix *LocusCoordMap,nmxMatrix *IllClassMap,nmxMatrix *ScoreMap,nmxMatrix *ChromaticityMap,nmxMatrix *SurfLocusHistogram,nmxMatrix *SurfDiscreteHistogram,nmxMatrix *BestSurfLocusHistogram,nmxMatrix *BestSurfLocusHistogramSum,nmxMatrix *BestSurfDiscreteHistogram,nmxMatrix *SurfLocusChroma,nmxMatrix *SurfClassChromaDiff,nmxMatrix *SurfClassChromaSqrDiff,nmxMatrix *SurfClassChromaFactor,nmxMatrix *SurfTargetClassChroma,nmxMatrix *SurfCombWeights,nmxMatrix *SurfsTotalScore,nmxMatrix *SurfsArea,nmxMatrix *IllClassesScore,nmxMatrix *CorrectionRbGains,nmxMatrix *NominalRbGains,nmxMatrix *ThreeHypothesis,nmxMatrix *LocusCoordResult,nmxMatrix *Locus10);
extern nmxRCode_t nmxAawbColorMatrixInterpolation_d(nmxMatrix *illColorMatrixes,double normalizeLocusCoord,nmxMatrix *illuminantsClassScores,nmxMatrix *colorMatrix,nmxMatrix *illClassColorMatrixes);
extern nmxRCode_t nmxAawbColorMatrixInterpolation_f(nmxMatrix *illColorMatrixes,float normalizeLocusCoord,nmxMatrix *illuminantsClassScores,nmxMatrix *colorMatrix,nmxMatrix *illClassColorMatrixes);
extern nmxRCode_t nmxAawbGenLocusCoords_d(nmxMatrix *lut_out);
extern nmxRCode_t nmxAawbGenLocusCoords_f(nmxMatrix *lut_out);
extern nmxRCode_t nmxAawbGetKelvinFromLocusCoords_d(nmxMatrix *illKelvin,nmxMatrix *locusCoords,nmxMatrix *locusKelvin);
extern nmxRCode_t nmxAawbGetKelvinFromLocusCoords_f(nmxMatrix *illKelvin,nmxMatrix *locusCoords,nmxMatrix *locusKelvin);
extern nmxRCode_t nmxAawbGetLocusCoordsFromKelvins_d(nmxMatrix *illKelvin,nmxMatrix *locusCoords,nmxMatrix *locusKelvin);
extern nmxRCode_t nmxAawbIteration_u8d(nmxMatrix *grid,uint8_t isLog,nmxMatrix *ctxPdf,nmxMatrix *IllClassesLikelihood,nmxMatrix *SurfsLikelihood,nmxMatrix *SurfsMinAreaPercent,nmxMatrix *SurfsMaxAreaPercent,nmxMatrix *sensorLogTilts,nmxMatrix *ChromaticityTable,nmxMatrix *SqrSigmaTableInv,nmxMatrix *SurfsIsReflectance,nmxMatrix *IllsLocusIdx,nmxMatrix *IllsLogGainPair,nmxMatrix *LocusLogGainPairs,double ChannelLowThrValue,double ClipHighThrPercent,double MaxAdaptiveCorrectionPercent,double SubsamplingFactor,double CornerSignificance,nmxMatrix *SkyPdf,nmxMatrix *LocusWeights,nmxMatrix *LogTable,nmxMatrix *LocusCoordRange,nmxMatrix *awbGains,nmxMatrix *estimatedPdf,nmxMatrix *surfLocusHistogram,nmxMatrix *surfLocusHistogramSum,nmxMatrix *surfDiscreteHistogram,nmxMatrix *surfLocusChroma,nmxMatrix *surfClassChromaDiff,nmxMatrix *surfClassChromaSqrDiff,nmxMatrix *surfClassChromaFactor,nmxMatrix *surfTargetClassChroma,nmxMatrix *surfCombWeights,nmxMatrix *surfUsedAreas,nmxMatrix *meanLocusHistogram,nmxMatrix *meanDiscreteHistogram,nmxMatrix *illuminantsClassScores,nmxMatrix *correctionRbGains,nmxMatrix *nominalRbGains,nmxMatrix *illuminantsClassHypothesis,nmxMatrix *locusCoordResult,nmxMatrix *Locus10);
extern nmxRCode_t nmxAawbIteration_u8f(nmxMatrix *grid,uint8_t isLog,nmxMatrix *ctxPdf,nmxMatrix *IllClassesLikelihood,nmxMatrix *SurfsLikelihood,nmxMatrix *SurfsMinAreaPercent,nmxMatrix *SurfsMaxAreaPercent,nmxMatrix *sensorLogTilts,nmxMatrix *ChromaticityTable,nmxMatrix *SqrSigmaTableInv,nmxMatrix *SurfsIsReflectance,nmxMatrix *IllsLocusIdx,nmxMatrix *IllsLogGainPair,nmxMatrix *LocusLogGainPairs,float ChannelLowThrValue,float ClipHighThrPercent,float MaxAdaptiveCorrectionPercent,float SubsamplingFactor,float CornerSignificance,nmxMatrix *SkyPdf,nmxMatrix *LocusWeights,nmxMatrix *LogTable,nmxMatrix *LocusCoordRange,nmxMatrix *awbGains,nmxMatrix *estimatedPdf,nmxMatrix *surfLocusHistogram,nmxMatrix *surfLocusHistogramSum,nmxMatrix *surfDiscreteHistogram,nmxMatrix *surfLocusChroma,nmxMatrix *surfClassChromaDiff,nmxMatrix *surfClassChromaSqrDiff,nmxMatrix *surfClassChromaFactor,nmxMatrix *surfTargetClassChroma,nmxMatrix *surfCombWeights,nmxMatrix *surfUsedAreas,nmxMatrix *meanLocusHistogram,nmxMatrix *meanDiscreteHistogram,nmxMatrix *illuminantsClassScores,nmxMatrix *correctionRbGains,nmxMatrix *nominalRbGains,nmxMatrix *illuminantsClassHypothesis,nmxMatrix *locusCoordResult,nmxMatrix *Locus10);
extern nmxRCode_t nmxAawb_u8d(nmxMatrix *grid,uint8_t isLog,uint8_t phase,nmxMatrix *CtxPdf,nmxMatrix *IllClassesLikelihood,nmxMatrix *SurfsLikelihood,nmxMatrix *SurfsMinAreaPercent,nmxMatrix *SurfsMaxAreaPercent,nmxMatrix *SurfsAdaptation,nmxMatrix *SensorLogTilts,nmxMatrix *ChromaticityTable,nmxMatrix *SqrSigmaTableInv,nmxMatrix *SurfsIsReflectance,nmxMatrix *IllsLocusIdx,nmxMatrix *IllsLogGainPair,nmxMatrix *LocusLogGainPairs,double ChannelLowThrValue,double ClipHighThrPercent,double MaxAdaptiveCorrectionPercent,double SubsamplingFactor,double CornerSignificance,nmxMatrix *SkyPdf,double SkyLocusCoord,nmxMatrix *LocusWeights,nmxMatrix *LogTable,nmxMatrix *AwbGains,nmxMatrix *EstimatedPdf,nmxMatrix *SurfMap,nmxMatrix *LocusCoordMap,nmxMatrix *IllClassMap,nmxMatrix *ScoreMap,nmxMatrix *ChromaticityMap,nmxMatrix *SurfLocusHistogram,nmxMatrix *SurfDiscreteHistogram,nmxMatrix *BestSurfLocusHistogram,nmxMatrix *BestSurfLocusHistogramSum,nmxMatrix *BestSurfDiscreteHistogram,nmxMatrix *SurfLocusChroma,nmxMatrix *SurfClassChromaDiff,nmxMatrix *SurfClassChromaSqrDiff,nmxMatrix *SurfClassChromaFactor,nmxMatrix *SurfTargetClassChroma,nmxMatrix *SurfCombWeights,nmxMatrix *SurfsTotalScore,nmxMatrix *SurfsArea,nmxMatrix *SurfsAreaPh1,nmxMatrix *IllClassesScore,nmxMatrix *CorrectionRbGains,nmxMatrix *NominalRbGains,nmxMatrix *LocusCoordResult,nmxMatrix *Locus10);
extern nmxRCode_t nmxAawb_u8f(nmxMatrix *grid,uint8_t isLog,uint8_t phase,nmxMatrix *CtxPdf,nmxMatrix *IllClassesLikelihood,nmxMatrix *SurfsLikelihood,nmxMatrix *SurfsMinAreaPercent,nmxMatrix *SurfsMaxAreaPercent,nmxMatrix *SurfsAdaptation,nmxMatrix *SensorLogTilts,nmxMatrix *ChromaticityTable,nmxMatrix *SqrSigmaTableInv,nmxMatrix *SurfsIsReflectance,nmxMatrix *IllsLocusIdx,nmxMatrix *IllsLogGainPair,nmxMatrix *LocusLogGainPairs,float ChannelLowThrValue,float ClipHighThrPercent,float MaxAdaptiveCorrectionPercent,float SubsamplingFactor,float CornerSignificance,nmxMatrix *SkyPdf,float SkyLocusCoord,nmxMatrix *LocusWeights,nmxMatrix *LogTable,nmxMatrix *AwbGains,nmxMatrix *EstimatedPdf,nmxMatrix *SurfMap,nmxMatrix *LocusCoordMap,nmxMatrix *IllClassMap,nmxMatrix *ScoreMap,nmxMatrix *ChromaticityMap,nmxMatrix *SurfLocusHistogram,nmxMatrix *SurfDiscreteHistogram,nmxMatrix *BestSurfLocusHistogram,nmxMatrix *BestSurfLocusHistogramSum,nmxMatrix *BestSurfDiscreteHistogram,nmxMatrix *SurfLocusChroma,nmxMatrix *SurfClassChromaDiff,nmxMatrix *SurfClassChromaSqrDiff,nmxMatrix *SurfClassChromaFactor,nmxMatrix *SurfTargetClassChroma,nmxMatrix *SurfCombWeights,nmxMatrix *SurfsTotalScore,nmxMatrix *SurfsArea,nmxMatrix *SurfsAreaPh1,nmxMatrix *IllClassesScore,nmxMatrix *CorrectionRbGains,nmxMatrix *NominalRbGains,nmxMatrix *LocusCoordResult,nmxMatrix *Locus10);

extern nmxRCode_t nmxArtAdaptiveGamma_d(nmxMatrix *Scale,nmxMatrix *HistIn,nmxMatrix *LutIn,double CentroidTarget,double GammaMin,double GammaMax,nmxMatrix *LutOut,nmxMatrix *HistOut,nmxMatrix *GammaOut,nmxMatrix *VTmp1,nmxMatrix *VTmp2);
extern nmxRCode_t nmxArtAdaptiveGamma_f(nmxMatrix *Scale,nmxMatrix *HistIn,nmxMatrix *LutIn,float CentroidTarget,float GammaMin,float GammaMax,nmxMatrix *LutOut,nmxMatrix *HistOut,nmxMatrix *GammaOut,nmxMatrix *VTmp1,nmxMatrix *VTmp2);
extern nmxRCode_t nmxArtBlackBoost_d(nmxMatrix *Scale,nmxMatrix *HistIn,nmxMatrix *LutIn,double Length,double Exp,nmxMatrix *Lut,nmxMatrix *Hist,nmxMatrix *CumHistIn,nmxMatrix *CumHist,nmxMatrix *LutSup);
extern nmxRCode_t nmxArtBlackBoost_f(nmxMatrix *Scale,nmxMatrix *HistIn,nmxMatrix *LutIn,float Length,float Exp,nmxMatrix *Lut,nmxMatrix *Hist,nmxMatrix *CumHistIn,nmxMatrix *CumHist,nmxMatrix *LutSup);
extern nmxRCode_t nmxArtComputeBlackBoostLut_d(nmxMatrix *Scale,double Length,double Exp,nmxMatrix *Lut);
extern nmxRCode_t nmxArtComputeBlackBoostLut_f(nmxMatrix *Scale,float Length,float Exp,nmxMatrix *Lut);
extern nmxRCode_t nmxArtComputeGainBoostLut_d(nmxMatrix *Scale,double Gain,nmxMatrix *Lut,nmxMatrix *ScaleTmp,nmxMatrix *LutTmp);
extern nmxRCode_t nmxArtComputeGainBoostLut_f(nmxMatrix *Scale,float Gain,nmxMatrix *Lut,nmxMatrix *ScaleTmp,nmxMatrix *LutTmp);
extern nmxRCode_t nmxArtComputeLmhPoints_d(nmxMatrix *Histogram,nmxMatrix *LmhPoints);
extern nmxRCode_t nmxArtComputeLmhPoints_f(nmxMatrix *Histogram,nmxMatrix *LmhPoints);
extern nmxRCode_t nmxArtComputeSCurveLut_d(double Strength,double MaxValue,nmxMatrix *Lut);
extern nmxRCode_t nmxArtComputeSCurveLut_f(float Strength,float MaxValue,nmxMatrix *Lut);
extern nmxRCode_t nmxArtGainBoost_d(nmxMatrix *Scale,nmxMatrix *HistIn,double GainTargetIn,double GbWpp,nmxMatrix *LutOut,nmxMatrix *HistOut,nmxMatrix *GainTargetOut,nmxMatrix *GainBoost,nmxMatrix *VTmp1,nmxMatrix *VTmp2);
extern nmxRCode_t nmxArtGainBoost_f(nmxMatrix *Scale,nmxMatrix *HistIn,float GainTargetIn,float GbWpp,nmxMatrix *LutOut,nmxMatrix *HistOut,nmxMatrix *GainTargetOut,nmxMatrix *GainBoost,nmxMatrix *VTmp1,nmxMatrix *VTmp2);
extern nmxRCode_t nmxArtNlToneMapping_du8(nmxMatrix *Scale,nmxMatrix *HistIn,uint8_t GainBoostEnable,double GainTargetIn,double GbWpp,uint8_t AdaptiveGammaEnable,double CentroidTarget,double GammaMin,double GammaMax,uint8_t SCurveEnable,double SCurveTarget,double SCurveMin,double SCurveMax,uint8_t BlackBoostEnable,double BbLength,double BbExp,nmxMatrix *LutOut,nmxMatrix *HistOut,nmxMatrix *GainBoost,nmxMatrix *GammaOut,nmxMatrix *SCurveProportion,nmxMatrix *LutTmp,nmxMatrix *HistTmp,nmxMatrix *VTmp1,nmxMatrix *VTmp2,nmxMatrix *VTmp3);
extern nmxRCode_t nmxArtNlToneMapping_fu8(nmxMatrix *Scale,nmxMatrix *HistIn,uint8_t GainBoostEnable,float GainTargetIn,float GbWpp,uint8_t AdaptiveGammaEnable,float CentroidTarget,float GammaMin,float GammaMax,uint8_t SCurveEnable,float SCurveTarget,float SCurveMin,float SCurveMax,uint8_t BlackBoostEnable,float BbLength,float BbExp,nmxMatrix *LutOut,nmxMatrix *HistOut,nmxMatrix *GainBoost,nmxMatrix *GammaOut,nmxMatrix *SCurveProportion,nmxMatrix *LutTmp,nmxMatrix *HistTmp,nmxMatrix *VTmp1,nmxMatrix *VTmp2,nmxMatrix *VTmp3);
extern nmxRCode_t nmxArtSCurve_d(nmxMatrix *Scale,nmxMatrix *HistIn,nmxMatrix *LutIn,double SCurveTarget,double SCurveMin,double SCurveMax,nmxMatrix *LutOut,nmxMatrix *HistOut,nmxMatrix *SCurveProportion,nmxMatrix *VTmp1,nmxMatrix *VTmp2,nmxMatrix *VTmp3);
extern nmxRCode_t nmxArtSCurve_f(nmxMatrix *Scale,nmxMatrix *HistIn,nmxMatrix *LutIn,float SCurveTarget,float SCurveMin,float SCurveMax,nmxMatrix *LutOut,nmxMatrix *HistOut,nmxMatrix *SCurveProportion,nmxMatrix *VTmp1,nmxMatrix *VTmp2,nmxMatrix *VTmp3);

#endif /* H_nmxAawbFunctions */

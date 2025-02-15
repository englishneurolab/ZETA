	function [vecThisDiff,vecThisFrac,vecThisFracLinear,vecRefT] = ...
			getTraceOffset(vecTraceT,vecTraceAct,vecStimUseOnTime,dblSamplingFreq,dblUseMaxDur)
	%getTraceOffset Calculate temporal offset vectors. Syntax:
	%[vecThisDiff,vecThisFrac,vecThisFracLinear] = ...
	%	getTraceOffset(vecSpikeT,vecSpikeTimes,vecStimUseOnTime,dblUseMaxDur)
	%
	%This is a subfunction for getZeta().
	
	
	%get data
	[vecRefT,matTracePerTrial] = getTraceInTrial(vecTraceT,vecTraceAct,vecStimUseOnTime,dblSamplingFreq,dblUseMaxDur);
	vecMeanTrace = nanmean(matTracePerTrial,1)';
	vecThisFrac = cumsum(vecMeanTrace) / sum(vecMeanTrace);
	
	%get linear fractions
	vecThisFracLinear = linspace(median(vecMeanTrace),sum(vecMeanTrace),numel(vecMeanTrace))' / sum(vecMeanTrace);
	
	%assign data
	vecThisDiff = vecThisFrac - vecThisFracLinear;
	vecThisDiff = vecThisDiff - mean(vecThisDiff);

end


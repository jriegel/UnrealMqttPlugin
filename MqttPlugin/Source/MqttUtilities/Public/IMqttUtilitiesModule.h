// Copyright (c) 2019 Nineva Studios

#pragma once

#include "CoreMinimal.h"
#include "Modules/ModuleManager.h"

DECLARE_LOG_CATEGORY_EXTERN(LogMQTT, Log, All);

class IMqttUtilitiesModule : public IModuleInterface
{
public:

	static inline IMqttUtilitiesModule& Get()
	{
		return FModuleManager::LoadModuleChecked<IMqttUtilitiesModule>("MqttUtilities");
	}

	static inline bool IsAvailable()
	{
		return FModuleManager::Get().IsModuleLoaded("MqttUtilities");
	}
};

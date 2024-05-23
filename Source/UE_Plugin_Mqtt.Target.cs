// Copyright Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;
using System.Collections.Generic;

public class UE_Plugin_MqttTarget : TargetRules
{
	public UE_Plugin_MqttTarget( TargetInfo Target) : base(Target)
	{
		Type = TargetType.Game;
        DefaultBuildSettings = BuildSettingsVersion.V4;
        IncludeOrderVersion = EngineIncludeOrderVersion.Latest;
        ExtraModuleNames.Add("UE_Plugin_Mqtt");
	}
}

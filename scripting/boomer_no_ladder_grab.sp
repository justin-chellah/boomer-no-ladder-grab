#include <sourcemod>

#define REQUIRE_EXTENSIONS
#include <sourcescramble>

#define GAMEDATA_FILE	"boomer_no_ladder_grab"

public void OnPluginStart()
{
	GameData hGameData = new GameData( GAMEDATA_FILE );

	if ( hGameData == null )
	{
		SetFailState( "Unable to load gamedata file \"" ... GAMEDATA_FILE ... "\"" );
	}

	MemoryPatch hMemoryPatcher = MemoryPatch.CreateFromConf( hGameData, "GetClass condition" );

	if ( !hMemoryPatcher.Validate() )
	{
		delete hGameData;

		SetFailState( "Unable to validate patch for \"GetClass condition\"" );
	}

	hMemoryPatcher.Enable();
}

public Plugin myinfo =
{
	name = "[L4D2] Boomer No Ladder Grab",
	author = "Justin \"Sir Jay\" Chellah",
	description = "QoL change which prevents boomers from grabbing ladders when walking across them, e.g. on rooftops",
	version = "1.0.0",
	url = "https://justin-chellah.com"
};
#define groupManagementDialog 55510
#define groupManagementPlayerList 55511
#define groupManagementGroupList 55512
#define groupManagementInviteButton 55514
#define groupManagementKickButton 55515
#define groupManagementDisbandButton 55516
#define groupManagementLeaveButton 55517
#define groupManagementAcceptButton 55518
#define groupManagementDeclineButton 55519
#define groupManagementInviteText 55520

class GroupManagement {

	idd = groupManagementDialog;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
		
		class MainBG : w_RscPicture {
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";		
			moving = true;
			x = 0.0; y = 0.1;
			w = 1.0; h = 0.65;
		};
		
		class MainTitle : w_RscText {
			idc = -1;
			text = "Управление группой";
			sizeEx = 0.04;
			shadow = 2;		
			x = 0.260; y = 0.112;
			w = 0.3; h = 0.05;
		};

		class InviteTitleText : w_RscText {
			idc = -1;
			text = "Игроки";
			sizeEx = 0.025;
			shadow = 2;		
			x = 0.0875; y = 0.155;
			w = 0.3; h = 0.050;
		};

		class GroupTitleText : w_RscText {
			idc = -1;
			text = "Ваша группа";
			sizeEx = 0.025;
			shadow = 2;		
			x = 0.5575; y = 0.155;
			w = 0.3; h = 0.050;
		};

		class InviteText: w_RscStructuredText
		{
			idc = groupManagementInviteText;
			text = "";
			size = 0.025;

			x = 0.255; y = 0.500;
			w = 0.235; h = 0.075;
		};
	};
	
	class controls {

		class PlayerListBox : w_Rsclist {
			idc = groupManagementPlayerList;
			onLBSelChanged = "call playerSelectChange;";
			x = 0.020; y = 0.200;
			w = 0.235; h = 0.380;
		};
		
		class RefreshButton : w_RscButton {
			idc = -1;
			text = "Обновить";
			onButtonClick = "call Updateplayerlist;";
			x = 0.08; y = 0.59;
			w = 0.125; h = 0.045 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};
		
		

		class GroupListBox : w_Rsclist {
			idc = groupManagementGroupList;
			x = 0.490; y = 0.200;
			w = 0.235; h = 0.425;
		};

		class CloseButton : w_RscButton {
			idc = -1;
			text = "Закрыть";
			onButtonClick = "closeDialog 0;groupManagmentActive = false;";
			x = 0.02; y = 0.68;
			w = 0.125; h = 0.045 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class InviteButton : w_RscButton {
			idc = groupManagementInviteButton;
			text = "Пригласить";
			onButtonClick = "call inviteToGroup;";
			x = 0.3075; y = 0.200;
			w = 0.147; h = 0.045 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};

		class KickButton : w_RscButton {
			idc = groupManagementKickButton;
			text = "Исключить";
			onButtonClick = "call kickFromGroup;";
			x = 0.3075; y = 0.250;
			w = 0.147; h = 0.045 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class DisbandButton : w_RscButton {
			idc = groupManagementDisbandButton;
			text = "Расформировать";
			onButtonClick = "call disbandGroup;";
			x = 0.3075; y = 0.300;
			w = 0.147; h = 0.045 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class LeaveButton : w_RscButton {
			idc = groupManagementLeaveButton;
			text = "Покинуть группу";
			onButtonClick = "call leaveGroup;";
			x = 0.3075; y = 0.400;
			w = 0.147; h = 0.045 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class AcceptInviteButton : w_RscButton {
			idc = groupManagementAcceptButton;
			text = "Принять";
			onButtonClick = "call acceptGroupInvite;";
			x = 0.275; y = 0.625 - 0.0255 * safezoneH;
			w = 0.100; h = 0.045 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};

		class DeclineInviteButton : w_RscButton {
			idc = groupManagementDeclineButton;
			text = "Отказаться";
			onButtonClick = "call declineGroupInvite;";
			x = 0.375; y = 0.625 - 0.0255 * safezoneH;
			w = 0.100; h = 0.045 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
	};
};
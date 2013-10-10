package uk.co.baremedia.gnome.navigation
{
	import flash.events.MouseEvent;

	public interface IViewnNavigator
	{
		function backButton_clickHandler(event:MouseEvent):void;
		function navigateToIndex(index:int):void;
	}
}
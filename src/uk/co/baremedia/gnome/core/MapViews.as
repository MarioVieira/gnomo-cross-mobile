package uk.co.baremedia.gnome.core
{
	import org.as3.mvcsInjector.interfaces.IMappingMediator;
	import org.robotlegs.core.IMediatorMap;
	
	import uk.co.baremedia.gnome.views.components.ComponentAlerts;
	import uk.co.baremedia.gnome.views.components.ComponentInfo;
	import uk.co.baremedia.gnome.views.components.ComponentLogs;
	import uk.co.baremedia.gnome.views.components.ComponentUnits;
	import uk.co.baremedia.gnome.views.mediators.MediatorScreenInfo;
	import uk.co.baremedia.gnome.views.mediators.MediatorScreenLogs;
	import uk.co.baremedia.gnome.views.mediators.MediatorUnits;
	
	public class MapViews implements IMappingMediator
	{
		public function mapMediators(mediatorMap:IMediatorMap):void
		{
			mediatorMap.mapView(ComponentUnits, MediatorUnits);
			mediatorMap.mapView(ComponentLogs, MediatorScreenLogs);
			mediatorMap.mapView(ComponentInfo, MediatorScreenInfo);
		}
	}
}
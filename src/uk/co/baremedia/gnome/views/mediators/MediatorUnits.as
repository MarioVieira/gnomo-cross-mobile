package uk.co.baremedia.gnome.views.mediators
{
	import org.as3.mvcsInjector.utils.Tracer;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.MediatorInit;
	
	import uk.co.baremedia.gnomo.controls.ControlPersistedData;
	import uk.co.baremedia.gnomo.controls.ControlUnits;
	import uk.co.baremedia.gnomo.interfaces.IConnected;
	import uk.co.baremedia.gnomo.models.ModelAudio;
	import uk.co.baremedia.gnomo.models.ModelModes;
	import uk.co.baremedia.gnomo.models.ModelNetworkManager;
	import uk.co.baremedia.gnomo.presentation.PresentationUnits;
	import uk.co.baremedia.gnomo.signals.SignalNotifier;
	
	import uk.co.baremedia.gnome.views.components.ComponentUnits;
	
	public class MediatorUnits extends MediatorInit
	{
		protected var _view	 	: ComponentUnits;
		protected var _injector	: IInjector;
		
		override public function init(injector:IInjector):void
		{
			super.init(injector);
			_view 		= injector.getInstance(ComponentUnits);
			_injector 	= injector;
		}
		
		override public function onRegister():void
		{ 
			Tracer.log(this, "onRegister()");
			_view.presentationModel = new PresentationUnits(_injector.getInstance(ControlUnits), 
															_injector.getInstance(ControlPersistedData),
															_injector.getInstance(ModelNetworkManager),
															_injector.getInstance(ModelModes),
															_injector.getInstance(ModelAudio),
															_injector.getInstance(IConnected),
															_injector.getInstance(SignalNotifier));
		}
		
		override public function onRemove():void
		{
			_view.presentationModel.dispose();	
		}
	}
}
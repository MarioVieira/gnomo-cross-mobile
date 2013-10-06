package views.mediators
{
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.MediatorInit;
	
	import uk.co.baremedia.gnomo.controls.ControlLogs;
	import uk.co.baremedia.gnomo.controls.ControlPersistedData;
	import uk.co.baremedia.gnomo.models.ModelSharedObject;
	import uk.co.baremedia.gnomo.presentation.PresentationLogs;
	
	import views.components.ComponentLogs;
	
	public class MediatorScreenLogs extends MediatorInit
	{
		private var _injector				: IInjector;
		private var _view					: ComponentLogs;
		
		override public function init(injector:IInjector):void
		{
			super.init(injector);
			_view 		= injector.getInstance(ComponentLogs);
			_injector 	= injector;
		}
		
		override public function onRegister():void
		{ 
			_view.supervisingPresenter = new PresentationLogs( _injector.getInstance(ControlLogs),  
															_injector.getInstance(ModelSharedObject), 
															_injector.getInstance(ControlPersistedData) );
		}
		
		override public function onRemove():void
		{
			_view.supervisingPresenter.dispose();
		}
	}
}
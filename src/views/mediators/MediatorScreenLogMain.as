package views.mediators
{
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.MediatorInit;
	
	import uk.co.baremedia.gnomo.controls.ControlLogs;
	import uk.co.baremedia.gnomo.presentation.PresentationLogs;
	
	import views.components.ComponentLogsMain;
	
	public class MediatorScreenLogMain extends MediatorInit
	{
		private var _view	 				: ComponentLogsMain;
		private var _injector				: IInjector;
		
		override public function init(injector:IInjector):void
		{
			super.init(injector);
			_view 		= injector.getInstance(ComponentLogsMain);
			_injector 	= injector;
		}
		
		override public function onRegister():void
		{ 
			_view.presentationModel = new PresentationLogs( _injector.getInstance(ControlLogs) );
		}
		
		override public function onRemove():void
		{
			_view.presentationModel.dispose();	
		}
	}
}
package uk.co.baremedia.gnome.views.mediators
{
	import org.as3.mvcsInjector.utils.Tracer;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.MediatorInit;
	
	import uk.co.baremedia.gnome.views.components.ComponentInfo;
	import uk.co.baremedia.gnomo.presentation.IComponentInfo;
	import uk.co.baremedia.gnomo.presentation.PresentationInfo;
	
	public class MediatorScreenInfo extends MediatorInit
	{
		protected var _injector:IInjector;
		
		override public function init(injector:IInjector):void
		{
			super.init(injector);
			_injector 	= injector;
			_view 		= injector.getInstance(ComponentInfo);
		}
		
		public var _view	 				:ComponentInfo;
		private var _presentationModel		:PresentationInfo;
		
		override public function onRegister():void
		{ 
			_presentationModel = new PresentationInfo(_view as IComponentInfo);
		}
		
		override public function onRemove():void
		{
			_presentationModel.dispose();	
		}
	}
}

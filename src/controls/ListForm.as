package controls
{
	import mx.events.FlexEvent;
	
	import spark.components.List;
	import spark.core.IDisplayText;
	
	public class ListForm extends List
	{
		[SkinPart(required="false")]
		public var titleDisplay:IDisplayText;
		public var hostComponent:Object;
		
		
		public function ListForm()
		{
			super();
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete)
		}
		
		protected function onCreationComplete(event:FlexEvent):void
		{
			removeEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete)
			setStyle("backgroundAlpha", 0);
		}
		
		//----------------------------------
		//  title
		//----------------------------------
		
		/**
		 *  @private
		 */
		private var _title:String = "";
		
		/**
		 *  @private
		 */
		private var titleChanged:Boolean;
		
		[Bindable]
		[Inspectable(category="General", defaultValue="")]
		
		/**
		 *  Title or caption displayed in the title bar. 
		 *
		 *  @default ""
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get title():String 
		{
			return _title;
		}
		
		/**
		 *  @private
		 */
		public function set title(value:String):void 
		{
			_title = value;
			
			if (titleDisplay)
				titleDisplay.text = title;
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (instance == titleDisplay)
			{
				titleDisplay.text = title;
			}
		}
	}
}
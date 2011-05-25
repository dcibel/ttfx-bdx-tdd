package ttfx.bdx.tdd {
	import flash.events.Event;
	
	public class CommandSuccessEvent extends Event {
		
		public static const SUCCESS:String = "success";
		
		public function CommandSuccessEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
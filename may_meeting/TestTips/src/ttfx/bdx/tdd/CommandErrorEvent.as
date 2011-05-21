package ttfx.bdx.tdd {
	import flash.events.Event;
	
	public class CommandErrorEvent extends Event {
		
		public static const ERROR:String = "error";
		
		public function CommandErrorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
	}
}
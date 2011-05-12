package ttfx.bdx.tdd
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.controls.Button;
	import mx.events.FlexEvent;
	
	import net.digitalprimates.fluint.async.AsyncHandler;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.core.isA;
	import org.osmf.events.TimeEvent;
	
	import spark.components.TextInput;

	public class AsyncTests {		
		
		private var textInput:TextInput;
		
		[Before( async, ui )]
		public function setUp():void {
			textInput = new TextInput();
			Async.proceedOnEvent( this, textInput, FlexEvent.CREATION_COMPLETE, 1000 );
			UIImpersonator.addChild( textInput );
		}
		
		[After( ui )]
		public function tearDown():void {
			UIImpersonator.removeAllChildren();
		}
		
		[Test(async, description="A timer should filre TIMER_COMPLETE event")]
		public function timerShouldFireCompleteEvent():void {
			var timer:Timer = new Timer(100, 1);
			
			var handleTimerComplete:Function = function(event:TimerEvent, passThroughData:Object):void {
				assertThat(event, isA(TimerEvent));
			};

			timer.addEventListener( TimerEvent.TIMER_COMPLETE, 
				Async.asyncHandler(this, handleTimerComplete, 500));
			
			timer.start();
		}
	}
}
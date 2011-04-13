package ttfx.bdx.tdd.contact.service {
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	
	public class ThirdPartyContactService extends EventDispatcher implements ContactService {
		
		private var nextGeneratedId:int = 0;
		private var contacts:ArrayCollection = new ArrayCollection();
		
		public function ThirdPartyContactService() {
			super();
		}
		
		public function getAllContacts(resultHandler:Function, faultHandler:Function):void {
			performOperation(function():void {
				resultHandler(copyOfContacts());
			}, faultHandler);
		}
		
		public function addContact(firstName:String, lastName:String, phone:String,
								   resultHandler:Function, faultHandler:Function):void {
			performOperation(function():void {
				var contact:Contact = new Contact(generateId(), firstName, lastName, phone);
				contacts.addItem(contact);
				resultHandler(contact);
			}, faultHandler);
		}
		
		public function updateContactContact(id:int, firstName:String, lastName:String, phone:String,
											 resultHandler:Function, faultHandler:Function):void {
			performOperation(function():void {
				var contact:Contact = contactWithId(id);
				if (contact) {
					contact.update(firstName, lastName, phone);
					resultHandler(contact);
				} else {
					faultHandler(new Error("Invalid id"));
				}
			}, faultHandler);
		}
		
		public function deleteContactContact(id:int,
											 resultHandler:Function, faultHandler:Function):void {
			performOperation(function():void {
				var contact:Contact = contactWithId(id);
				if (contact) {
					contacts.removeItemAt( contacts.getItemIndex(contact) );
					resultHandler(null);
				} else {
					faultHandler(new Error("Invalid id"));
				}
			}, faultHandler);
		}
		
		private function generateId():int {
			return nextGeneratedId++;
		}
		
		private function contactWithId(id:int):Contact {
			for each(var contact:Contact in contacts) {
				if (contact.id == id) {
					return contact;
				}
			}
			return null;
		}
		
		private function copyOfContacts():IList {
			var copy:ArrayCollection = new ArrayCollection();
			
			for each(var contact:Contact in contacts) {
				copy.addItem(new Contact(contact.id,
					contact.firstName, contact.lastName, contact.phone));
			}
			
			return copy;
		}
		
		private function performOperation(command:Function, faultHandler:Function):void {
			var operation:UglyOperation = new UglyOperation();
			operation.perform(command, faultHandler);
		}
		
	}

}
import flash.events.TimerEvent;
import flash.utils.Timer;

class UglyOperation {

	private var SUCCESS_PROBABILITY:Number = 0.6;
	private var _command:Function;
	private var _errorHandler:Function;
	
	public function perform(command:Function, errorHandler:Function):void {
		_command = command;
		_errorHandler = errorHandler;
		var timer:Timer = new Timer(4000, 1);
		timer.start();
		timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(event:TimerEvent):void {
			if (isSuccess()) {
				_command();
			} else {
				_errorHandler(new Error("Something went wrong"));
			}
		});
	}
	
	public function isSuccess():Boolean {
		return Math.random() < SUCCESS_PROBABILITY;
	}
}

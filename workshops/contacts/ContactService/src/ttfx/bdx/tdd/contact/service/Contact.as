package ttfx.bdx.tdd.contact.service
{
	import flash.events.EventDispatcher;
	
	[Bindable]
	public class Contact extends EventDispatcher {
		
		private var _id:int;
		private var _firstName:String;
		private var _lastName:String;
		private var _phone:String;
		
		public function Contact(id:int, firstName:String, lastName:String, phone:String) {
			this._id = id;
			update(firstName, lastName, phone);
		}
		
		public function update(firstName:String, lastName:String, phone:String):void {
			this._firstName = firstName;
			this._lastName = lastName;
			this._phone = phone;
		}
		
		public function get id():int {
			return _id;
		}
		
		public function get firstName():String {
			return _firstName;
		}
		
		public function get lastName():String {
			return _lastName;
		}
		
		public function get phone():String {
			return _phone;
		}
	}
}
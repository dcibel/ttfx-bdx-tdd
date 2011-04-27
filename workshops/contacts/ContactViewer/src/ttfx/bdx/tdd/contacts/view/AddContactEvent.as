package ttfx.bdx.tdd.contacts.view {
    import flash.events.Event;
        
    public class AddContactEvent extends Event {
        
        public static const ADD_CONTACT:String = "addContact";
        
        public var firstName:String;
        public var lastName:String;
        
        public function AddContactEvent(type:String, firstName:String, lastName:String,
                                        bubbles:Boolean=false, cancelable:Boolean=false) {
            super(type, bubbles, cancelable);
            this.firstName = firstName;
            this.lastName = lastName;
        }
        
        override public function clone():Event {
            return new AddContactEvent(this.type, this.firstName, this.lastName, this.bubbles, this.cancelable);
        }
    }
}
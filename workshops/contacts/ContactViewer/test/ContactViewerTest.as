package  {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	
	import ttfx.bdx.tdd.contact.service.Contact;
	import ttfx.bdx.tdd.contacts.view.AddContactEvent;
	import ttfx.bdx.tdd.contacts.view.ContactsViewModel;

	public class ContactViewerTest {		
		
		[Test]
		public function testGetAllContactsOnCreationComplete():void {
			var application:ContactViewer = new ContactViewer();
			var recordingViewModel:ContactsViewModelRecording = new ContactsViewModelRecording();
			application.viewModel = recordingViewModel;
			
			application.dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
			
			assertEquals(1, recordingViewModel.callCount("getContacts"));
		}
		
        [Test]
        public function testAddContactWhenAddContactEventIsDispatched():void {
            var application:ContactViewer = new ContactViewer();
            
            UIImpersonator.addChild( application );
            
            var recordingViewModel:ContactsViewModelRecording = new ContactsViewModelRecording();
            application.viewModel = recordingViewModel;
            
            application.addContactPanel.dispatchEvent(new AddContactEvent(AddContactEvent.ADD_CONTACT, "Tonton", "Flexeur"));
            
            assertEquals(1, recordingViewModel.callCount("addContact"));
            assertEquals("Tonton", recordingViewModel.getCallArgs("addContact", 0)[0]);
            assertEquals("Flexeur", recordingViewModel.getCallArgs("addContact", 0)[1]);
        }
        
		[Test]
		public function testContactListPanelUsesViewModelList():void {
			var application:ContactViewer = new ContactViewer();
			application.viewModel = new ContactsViewModelStub();
			
			application.viewModel.contacts = new ArrayCollection([
				new Contact(0, "Bruce", "Wayne", "00000"),
				new Contact(1, "John", "McLane", "00000")]);
			
			UIImpersonator.addChild( application );
			
			assertEquals(application.viewModel.contacts.getItemAt(0), application.contactsPanel.contacts.getItemAt(0));
			assertEquals(application.viewModel.contacts.getItemAt(1), application.contactsPanel.contacts.getItemAt(1));
			assertEquals(2, application.contactsPanel.contacts.length);
		}
	}
}
import flash.utils.Dictionary;

import ttfx.bdx.tdd.contacts.view.ContactsViewModel;

class ContactsViewModelRecording extends ContactsViewModel {
	
	private var calls:Dictionary = new Dictionary();
	
	public function ContactsViewModelRecording() {
		super(null);
	};
	
	override public function getContacts():void {
		recordCall("getContacts");
	}
    
    override public function addContact(firstName:String, lastName:String):void {
        recordCall("addContact", firstName, lastName);
    }
	
	private function recordCall(functionName:String, ...args):void {
		if ( !calls[functionName] ) {
			calls[functionName] = new Array();
		}
		calls[functionName].push(args);
	}
	
	public function callCount(functionName:String):int {
		if ( !calls[functionName] ) {
			return 0;
		} else {
			return calls[functionName].length;
		}
	}
    
    public function getCallArgs(functionName:String, index:int):Array {
        return calls[functionName][index];
    }
}

class ContactsViewModelStub extends ContactsViewModel {
	
	public function ContactsViewModelStub() {
		super(null);
	};
	
	override public function getContacts():void {
	}
}
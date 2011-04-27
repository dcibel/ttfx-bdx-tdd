package ttfx.bdx.tdd.contacts.view {
    import flash.events.Event;
    
    import mx.controls.Button;
    import mx.controls.TextInput;
    import mx.events.FlexEvent;
    
    import org.flexunit.assertThat;
    import org.flexunit.asserts.assertEquals;
    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertNull;
    import org.flexunit.asserts.assertTrue;
    import org.fluint.uiImpersonation.UIImpersonator;
    
    public class AddContactPanelTest {		
        
        
        [Test]
        public function testDispatchesAddContactEventWhenAddButtonIsClicked():void {
            var panel:AddContactPanel = new AddContactPanel();
            UIImpersonator.addChild(panel);
            panel.firstNameInput.text = "Tonton";
            panel.lastNameInput.text = "Flexeur";
            
            var dispatchedEvent:AddContactEvent;
            panel.addEventListener(AddContactEvent.ADD_CONTACT, function(event:AddContactEvent):void {
                dispatchedEvent = event;
            });
            panel.addButton.dispatchEvent(new FlexEvent(FlexEvent.BUTTON_DOWN));

            assertNotNull(dispatchedEvent);
            assertEquals("Tonton", dispatchedEvent.firstName);
            assertEquals("Flexeur", dispatchedEvent.lastName);
        }
        
        [Test]
        public function testClearsFormWhenAddButtonIsClicked():void {
            var panel:AddContactPanel = new AddContactPanel();
            UIImpersonator.addChild(panel);
            panel.firstNameInput.text = "Tonton";
            panel.lastNameInput.text = "Flexeur";
            
            panel.addButton.dispatchEvent(new FlexEvent(FlexEvent.BUTTON_DOWN));
            
            assertEmptyTextInput(panel.firstNameInput);
            assertEmptyTextInput(panel.lastNameInput);
        }
        
        private function assertEmptyTextInput(input:TextInput):void {
            assertTrue(input.name + " should be empty but contains " + input.text,
                input.text == null || input.text.length == 0);
        }
    }
}
package main.test;

import static org.junit.Assert.*;

import main.controller.ContentController;
import org.junit.Test;


public class ControllerTest {

    @Test
    public void testMe() {
        ContentController contentController = new ContentController();
        assertNotNull(contentController);
    }

}

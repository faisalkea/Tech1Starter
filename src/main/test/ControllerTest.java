package main.test;

import static org.junit.Assert.*;

import main.controller.ContentController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
public class ControllerTest {

    @Test
    public void testMe() {
        ContentController contentController = new ContentController();
        assertNotNull(contentController);
    }

}

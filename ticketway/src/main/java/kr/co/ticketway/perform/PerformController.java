package kr.co.ticketway.perform;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="/perform")
public class PerformController {

	private final static Logger logger = LoggerFactory.getLogger(PerformController.class);
}

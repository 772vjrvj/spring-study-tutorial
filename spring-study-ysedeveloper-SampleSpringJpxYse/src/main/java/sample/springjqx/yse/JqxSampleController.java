package sample.springjqx.yse;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JqxSampleController {
	
	@Autowired
	BookService bookService;
	private static Logger log = LoggerFactory.getLogger(BookController.class);
	
	@RequestMapping(value = "/jqxBasicGridSample", method = RequestMethod.GET)
	public ModelAndView jqxBasicGridSample() {
		log.info("jqxBasicGridSample start");
		return new ModelAndView("jqxGrid/jqxBasicGridSample");
	}
	
	@RequestMapping(value = "/jqxBasicGridSampleDataSourceJson", method = RequestMethod.GET)
	public ModelAndView jqxBasicGridSampleDataSourceJson() {
		log.info("jqxBasicGridSampleDataSourceJson start");
		
		
		return new ModelAndView("jqxGrid/jqxBasicGridSampleDataSourceJson");
	}

	@RequestMapping(value = "/jqxBasicGridSampleCustomColumnEditor", method = RequestMethod.GET)
	public ModelAndView jqxBasicGridSampleCustomColumnEditor() {
		log.info("jqxBasicGridSampleDataSourceJson start");
		
		return new ModelAndView("jqxGrid/jqxBasicGridSampleCustomColumnEditor");
	}

	@RequestMapping(value = "/jqxBasicGridSampleCustomizedEditors", method = RequestMethod.GET)
	public ModelAndView jqxBasicGridSampleCustomizedEditors() {
		log.info("jqxBasicGridSampleCustomizedEditors start");
		
		return new ModelAndView("jqxGrid/jqxBasicGridSampleCustomizedEditors");
	}
	
	@RequestMapping(value = "/jqxBasicGridSampleGroupingAggregates", method = RequestMethod.GET)
	public ModelAndView jqxBasicGridSampleGroupingAggregates() {
		log.info("jqxBasicGridSampleGroupingAggregates start");
		
		return new ModelAndView("jqxGrid/jqxBasicGridSampleGroupingAggregates");
	}
	
	
	@RequestMapping(value = "/jqxBasicGridSampleEditingDisableEditingOfRows", method = RequestMethod.GET)
	public ModelAndView jqxBasicGridSampleEditingDisableEditingOfRows() {
		log.info("jqxBasicGridSampleEditingDisableEditingOfRows start");
		
		return new ModelAndView("jqxGrid/jqxBasicGridSampleEditingDisableEditingOfRows");
	}
	
	@RequestMapping(value = "/jqxTreeGridDemoPagingPaing", method = RequestMethod.GET)
	public ModelAndView jqxTreeGridDemoPagingPaing() {
		log.info("jqxTreeGridDemoPagingPaing start");
		
		return new ModelAndView("jqxTreeGrid/jqxTreeGridDemoPagingPaing");
	}
	
}

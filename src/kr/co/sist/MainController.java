package kr.co.sist;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MainController {
	
	@GetMapping(value="/")
	public String indexMove() {
		return "redirect:index.html";
	} // index
	
	@GetMapping(value="/index")
	public String index() {
		return "index";
	} // index
	
	@GetMapping(value="/method/get")
	public String getProcess() {
		return "get";
	} // index
	
	@PostMapping(value="/method/post")
	public String postProcess() {
		System.out.println("post����� ��û");
		return "post";
	} // postProcess
	
	@ResponseBody
	@PutMapping(value="/method/put/{id}", produces="application/json;charset=UTF-8") // {id} = put/ �ڿ� �ԷµǴ� ����(??)
	public String putProcess(@RequestBody String param_json) {
		System.out.println("put����� ��û");
		
		JSONParser jp = new JSONParser(); 
		JSONObject param = null;
		
		try {
			param = (JSONObject) jp.parse(param_json);
		} catch(ParseException pe) {
			pe.printStackTrace();
		} // end catch
		
		System.out.println("�̸� "+param.get("name"));
		System.out.println("���� "+param.get("age"));
		System.out.println("���� "+param.get("job"));
		
		JSONObject jo = new JSONObject();
		
		System.out.println(param_json);
		jo.put("id", "kim");
		jo.put("password", "1234");
		jo.put("name", "������");
		jo.put("url", "/method/move_put_page.do");
		
		return jo.toJSONString();
	} // postProcess
	
	@PostMapping(value="/method/move_putpage.do")
	public String putPage() {
		System.out.println("post����� ��û");
		return "put";
	} // postProcess
	
} // class

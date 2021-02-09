package com.soo.projectboard;

import java.io.File;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.soo.projectuser.Soo_projectUserService;
import com.soo.projectuser.Soo_projectUserVO;


/**
 * 게시판 컨트롤러 
 * @author  
 */
@Controller
@RequestMapping("/board") //"/soo_project1_board/*"
public class Soo_projectBoardController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	
	@Resource(name = "Soo_projectBoardService")
	private Soo_projectBoardService service;
	
	/*@Autowired
	private Soo_projectUserVO UserVO;*/
	
/*	@Resource
	private Soo_projectUserService user_service;*/
	
	//@Autowired 
	//private Soo_projectBoardVO vo;
	
	//전체 게시판 리스트
	@RequestMapping("/soo_project1_Board_list.do")
	public String showBoardList(HttpServletRequest request, HttpSession session, ModelMap model, SearchVO search) throws Exception {
		
		//session.setAttribute("isLogOn", true);
		//String viewName = (String)request.getAttribute("viewName");
		
		//UserVO = user_service.loginbyId(UserVO); //로그인 정보를 불러온다.
		String condition = search.getCondition();
		
		
		System.out.println("parameter(페이지번호): " + search.getPage() + "번");
		System.out.println("검색 조건: " + condition);
		System.out.println("검색어: " + search.getKeyword());
		
		//boolean bl = (boolean)session.getAttribute("isLogOn");
		//System.out.println(bl);
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		
		List<Soo_projectBoardVO> list = (List<Soo_projectBoardVO>)service.selectBoardList(search);		
		pc.setArticleTotalCount(service.countArticles(search));
		
		System.out.println("PageVO 객체에 들어있는 것" +pc.getPaging());
		System.out.println("페이지 총 갯수:" +pc.getArticleTotalCount());
		
		System.out.println("글목록전체조회" + list.size());
		
		model.addAttribute("articles" , list); 
		model.addAttribute("pc", pc);
	
		
		
		return "/views/board/board_list";
		
	}
	
	/*//다중
	@ResponseBody
	@RequestMapping(value="/board/addNewArticle.do" ,method = RequestMethod.POST)
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, 
	HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("parentNO", 0);
		articleMap.put("id", id);
		articleMap.put("imageFileName", imageFileName);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int articleNO = boardService.addNewArticle(articleMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
	
			message = "<script>";
			message += " alert('������ �߰��߽��ϴ�.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			
			message = " <script>";
			message +=" alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	*/
	
	
	//조회하기
	@RequestMapping(value="/content" , method = RequestMethod.GET)
	public String content(@RequestParam int board_seq, ModelMap model) throws SQLException {
		
		//Soo_projectBoardVO vo = new Soo_projectBoardVO();
		System.out.println("content 요청 들어오는가?");
		System.out.println("글번호: " + board_seq);
		
		//각 글을 가져온다.
		Soo_projectBoardVO vo = service.getArticle(board_seq);
		
		
		System.out.println("content의  vo의 정체가 무엇인가" + vo);
		model.addAttribute("article", vo);
		System.out.println("이미지파일 가져오는가?" + vo.getImageFileName());
		
		return "/views/board/board_view";
	}
	
	//글쓰기 창 진입
	@RequestMapping(value = "/articleForm.do", method =  RequestMethod.GET)
	private ModelAndView articleform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName"); //인터셉터에서 바인딩된 뷰이름을 가져옵니다.
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}

	
	  //파일 업로드 메서드 - 업로드한 파일을 받은 후 반환합니다.
	  //priavte를 붙이는 이유: BoardContorller 내에서만 사용되기 때문
	   private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
	      String imageFileName= null;
	      Iterator<String> fileNames = multipartRequest.getFileNames();
	      
	      while(fileNames.hasNext()){
	         String fileName = fileNames.next();
	         MultipartFile mFile = multipartRequest.getFile(fileName);
	         imageFileName=mFile.getOriginalFilename();
	         File file = new File(ARTICLE_IMAGE_REPO +"\\"+ fileName);
	         if(mFile.getSize()!=0){ //File Null Check
	            if(! file.exists()){ //  λ                          
	               if(file.getParentFile().mkdirs()){ //  ο   ش  ϴ     丮         
	                     file.createNewFile(); //              
	               }
	            }
	            //Temp 폴더에 미리 업로드를 한다고?
	            mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFileName)); // ӽ÷        multipartFile           Ϸ      
	         }
	      }
	      return imageFileName;
	   }
	
	   	//articleForm.jsp에서 글쓰기 누르고 난 이후 메서드
	   @RequestMapping(value="/addNewArticle.do" ,method = RequestMethod.POST)
	   @ResponseBody
	   public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest,HttpServletRequest request, 
	   HttpServletResponse response) throws Exception {
	      multipartRequest.setCharacterEncoding("utf-8");
	      
	      //System.out.println("state값" + state);
	      //맵 생성
	
	      Object board_type2 = request.getParameter("board_type");
	      
	      String aaa = board_type2.toString();
	      
	      int board_type= Integer.parseInt(aaa);
	      
	      System.out.println("board_type" + board_type);
	      Map<String,Object> articleMap = new HashMap<String, Object>();
	      
	      
	      Enumeration enu=multipartRequest.getParameterNames(); //전송된 파라미터값을 가져온다.
	      while(enu.hasMoreElements()){
	         String name=(String)enu.nextElement();
	         String value=multipartRequest.getParameter(name);
	         articleMap.put(name,value);
	      }
	      
	      //브레이크 포인트 여기서 멈췄다. FileNotFoundException 
	      String imageFileName= upload(multipartRequest); //업로드 메서드 호출
	      HttpSession session = multipartRequest.getSession();
	      Soo_projectUserVO memberVO = (Soo_projectUserVO) session.getAttribute("member");
	      
	      String board_writer_name = memberVO.getSoo_user_name();
	      //articleMap.put("parentNO", 0);
	      articleMap.put("board_writer_name", board_writer_name);
	      articleMap.put("imageFileName", imageFileName);
	      articleMap.put("board_type", board_type);
	      //articleMap.put("board_type", state);
	      
	      String message;
	      ResponseEntity resEnt=null;
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	      try {
	         Integer board_seq = service.addNewArticle(articleMap);
	         
	         if(imageFileName!=null && imageFileName.length()!=0) { //첨부된 파일이 있을경우
	            File srcFile = new 
	            File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
	            File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+board_seq);
	            FileUtils.moveFileToDirectory(srcFile, destDir,true); // 글정보를 추가한 후 업로드한 이미지 파일을 글번호로 명명한 폴더로 이동합니다.
	         }
	   
	         //지정된 경로를 찾을수 없습니다 500에러: article_image안에 temp폴더가 삭제되었었나 보다. 다시 추가하니까 해결되었다.
	         message = "<script>";
	         message += " alert('새 글이 추가되었습니다.');";
	         message += " location.href='"+multipartRequest.getContextPath()+"/board/soo_project1_Board_list.do'; ";
	         message +=" </script>";
	          resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    
	      //예외가 발생했을 경우
	      }catch(Exception e) {
	         File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
	         srcFile.delete();
	         
	         message = " <script>";
	         message +=" alert('오류가 발생했습니다. 다시 시도해주세요.');";
	         message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do';";
	         message +=" </script>";
	         resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	         e.printStackTrace();
	      }
	      return resEnt;
	   }
	   
	  //수정하기
	   
	   @RequestMapping(value="/modArticle.do" ,method = RequestMethod.POST)
	   @ResponseBody
	   public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  
	     HttpServletResponse response) throws Exception{
	    multipartRequest.setCharacterEncoding("utf-8");
	    
	 	Map<String,Object> articleMap = new HashMap<String, Object>();
	 	
	 	Enumeration enu=multipartRequest.getParameterNames();
	 	while(enu.hasMoreElements()){
	 		String name=(String)enu.nextElement();
	 		String value=multipartRequest.getParameter(name);
	 		articleMap.put(name,value);
	 	}
	 	
	 	String imageFileName= upload(multipartRequest);
	 	HttpSession session = multipartRequest.getSession();
	 	Soo_projectUserVO memberVO = (Soo_projectUserVO) session.getAttribute("member");
	 	String id = memberVO.getSoo_user_name();
	 	//articleMap.put("id", id);
	 	articleMap.put("imageFileName", imageFileName);
	 	
	 	String board_seq=(String)articleMap.get("board_seq");
	 	String message;
	 	ResponseEntity resEnt=null;
	 	HttpHeaders responseHeaders = new HttpHeaders();
	 	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	     try {
	    	    service.modArticle(articleMap);
	        
	        if(imageFileName!=null && imageFileName.length()!=0) {
	          File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
	          File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+board_seq);
	          FileUtils.moveFileToDirectory(srcFile, destDir, true);
	          
	          String originalFileName = (String)articleMap.get("originalFileName");
	          File oldFile = new File(ARTICLE_IMAGE_REPO+"\\"+board_seq+"\\"+originalFileName);
	          oldFile.delete();
	        }	
	        message = "<script>";
	 	   message += " alert('수정 되었습니다.');";
	 	   message += " location.href='"+multipartRequest.getContextPath()+"/board/content?board_seq="+board_seq+"';";
	 	   message +=" </script>";
	        resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	     }catch(Exception e) {
	       File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
	       srcFile.delete();
	       message = "<script>";
	 	  message += " alert('������ �߻��߽��ϴ�.�ٽ� �������ּ���');";
	 	  message += " location.href='"+multipartRequest.getContextPath()+"/board/content?board_seq="+board_seq+"';";
	 	  message +=" </script>";
	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	     }
	     return resEnt;
	   }
	   
	   @RequestMapping(value="/removeArticle.do" ,method = RequestMethod.POST)
	   @ResponseBody
	   public ResponseEntity  removeArticle(@RequestParam("board_seq") int board_seq,
	                               HttpServletRequest request, HttpServletResponse response) throws Exception{
	 	response.setContentType("text/html; charset=UTF-8");
	 	String message;
	 	ResponseEntity resEnt=null;
	 	HttpHeaders responseHeaders = new HttpHeaders();
	 	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	 	try {
	 		service.removeArticle(board_seq);
	 		File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+board_seq);
	 		FileUtils.deleteDirectory(destDir);
	 		
	 		message = "<script>";
	 		message += " alert('삭제 되었습니다.');";
	 		message += " location.href='"+request.getContextPath()+"/board/soo_project1_Board_list.do';";
	 		message +=" </script>";
	 	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 	       
	 	}catch(Exception e) {
	 		message = "<script>";
	 		message += " alert('�۾��� ������ �߻��߽��ϴ�.�ٽ� �õ��� �ּ���.');";
	 		message += " location.href='"+request.getContextPath()+"/board/soo_project1_Board_list.do';";
	 		message +=" </script>";
	 	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 	    e.printStackTrace();
	 	}
	 	return resEnt;
	   }  
	   
	   
	   
	   
	   
	  
	
	
}

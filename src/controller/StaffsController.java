package controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.StaffsDAO;
import pojo.Staffs;
import pojo.Departs;
import dao.DepartsDAO;

@Controller
@RequestMapping("staffs")
public class StaffsController {
	@Autowired
	StaffsDAO std;
	@Autowired
	DepartsDAO dpd;
	@Autowired
	ServletContext context;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String staffs(ModelMap model) {
		model.addAttribute("staffs", std.getStaffs());
		return "staffs/list";
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String staffs2(ModelMap model, HttpServletRequest request) {
		try {
			int id = Integer.valueOf(request.getParameter("id"));
			model.addAttribute("id", id);
			model.addAttribute("staffs", std.getStaff(id));
		} catch (Exception e) {
			System.out.println("Loi: " + e);
			return "errors/404";
		}
		return "staffs/profile";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String get(ModelMap model) {
		model.addAttribute("start",true);
		return "staffs/add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String get(ModelMap model, HttpServletRequest request, @RequestParam("photo2") MultipartFile image,
			@ModelAttribute("staffs") @Valid Staffs staffs, BindingResult result) {
		String modifiedDate = "";
		if (result.hasErrors()) {
			try {
				modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(staffs.getBirthday());
			} catch (Exception e) {
				System.out.println("Birthday Error");
			}
			model.addAttribute("date", modifiedDate);
			return "staffs/add";
		} else if (!image.isEmpty() && !image.getOriginalFilename()
				.matches("(?:([^:/?#]+):)?(?://([^/?#]*))?([^?#]*\\.(?:jpg|gif|png))(?:\\?([^#]*))?(?:#(.*))?")) {
			System.out.println("Loi dinh dang anh");
			model.addAttribute("photoError", true);
			try {
				modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(staffs.getBirthday());
			} catch (Exception e) {
				System.out.println("Loi convert birthday");
			}
			model.addAttribute("date", modifiedDate);
			return "staffs/add";
		} else {
			try {
				modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(staffs.getBirthday());
				staffs.setBirthday(Date.valueOf(modifiedDate));
			} catch (Exception e) {
				System.out.println("Birthday Error");
			}
			staffs.setPhoto(uploadImage(image));
			System.out.println(staffs.getPhoto());
		}
			if (std.insertStaff(staffs)) {
				model.addAttribute("add",true);
				model.addAttribute("staffs",staffs);
				model.addAttribute("oldphoto",staffs.getPhoto());
				System.out.println("Them nhan vien thanh cong");
			} else {
				System.out.println("Loi them nhan vien");
			}
		return "staffs/update";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String getUpdate(ModelMap model, HttpServletRequest request) {
		try {
			int id = Integer.valueOf(request.getParameter("id"));
			model.addAttribute("oldphoto",std.getStaff(id).getPhoto());
			model.addAttribute("staffs", std.getStaff(id));
		} catch (Exception e) {
			System.out.println("Loi: " + e);
			return "errors/404";
		}
		return "staffs/update";
	}
	

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request, @RequestParam("photo2") MultipartFile image,
			@ModelAttribute("staffs") @Valid Staffs staffs, BindingResult result) {
		model.addAttribute("oldphoto",request.getParameter("oldphoto"));
		String modifiedDate = "";
		if (result.hasErrors()) {
			try {
				modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(staffs.getBirthday());
			} catch (Exception e) {
				System.out.println("Birthday Error");
			}
			model.addAttribute("date", modifiedDate);
			return "staffs/update";
		} else if (!image.isEmpty() && !image.getOriginalFilename()
				.matches("(?:([^:/?#]+):)?(?://([^/?#]*))?([^?#]*\\.(?:jpg|gif|png))(?:\\?([^#]*))?(?:#(.*))?")) {
			System.out.println("Loi dinh dang anh");
			model.addAttribute("photoError", true);
			try {
				modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(staffs.getBirthday());
			} catch (Exception e) {
				System.out.println("Loi convert birthday");
			}
			model.addAttribute("date", modifiedDate);
			return "staffs/update";
		} else {
			String img = uploadImage(image);
			if (img.equals("noimage.jpg")) {
				staffs.setPhoto(request.getParameter("oldphoto"));
				try {
					modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(staffs.getBirthday());
					staffs.setBirthday(Date.valueOf(modifiedDate));
				} catch (Exception e) {
					System.out.println("Loi convert birthday");
				}
			} else {
				staffs.setPhoto(img);
				try {
					modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(staffs.getBirthday());
					staffs.setBirthday(Date.valueOf(modifiedDate));
				} catch (Exception e) {
					System.out.println("Loi convert birthday");
				}
			}
			System.out.println(modifiedDate);
		}

		if (std.updateStaff(staffs)) {
			model.addAttribute("update",true);
			System.out.println("Cap nhat nhan vien thanh cong");
		} else {
			System.out.println("Loi cap nhat nhan vien");
		}
		model.addAttribute("oldphoto",staffs.getPhoto());
		model.addAttribute("staffs", staffs);
		return "staffs/update";
	}

	@RequestMapping(value = "delete")
	public String delete(ModelMap model, HttpServletRequest request) {
		int id = Integer.valueOf(request.getParameter("id"));
		if (std.deledeStaff(id)) {
			model.addAttribute("delete",true);
			model.addAttribute("staffs", std.getStaffs());
			System.out.println("Xoa thanh cong id=" + id);
		} else {
			System.out.println("Xoa that bai");
		}
		return "staffs/list";
	}

	public String uploadImage(MultipartFile image) {
		if (image.isEmpty()) {
			System.out.println("File error");
			return "noimage.jpg";
		} else {
			try {
				String path = context.getRealPath("/resources/avatar/") + image.getOriginalFilename();
				System.out.println(path);
				image.transferTo(new File(path));
				return image.getOriginalFilename();
			} catch (Exception e) {
				System.out.println("Loi: " + e);
				return "noimage.jpg";
			}
		}
	}

	@ModelAttribute("departs")
	public List<Departs> getDeparts() {
		List<Departs> departs = dpd.getDeparts();
		return departs;
	}

	@ModelAttribute(value="newId")
	public String getNewId() {
		return std.getNewCodeId();
	}

	@ModelAttribute("staffs")
	public Staffs getStaffs(Staffs staffs) {
		return staffs;
	}

	@ModelAttribute("menu")
	public String getAside() {
		return "staffs";
	}
}

package controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.DepartsDAO;
import dao.RecordsDAO;
import dao.StaffsDAO;
import pojo.Departs;
import pojo.Records;
import pojo.Staffs;

@Controller
@RequestMapping("records")
public class RecordsController {
	@Autowired
	RecordsDAO rcd;
	@Autowired
	StaffsDAO std;
	@Autowired
	DepartsDAO dpd;
	@Autowired
	JavaMailSender mailer;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String getAdd(ModelMap model) {
		model.addAttribute("menu", "records");
		return "records/add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(ModelMap model, HttpServletRequest request) {
		String[] nv = request.getParameterValues("staffs");
		String reason = request.getParameter("reason");
		int type = Integer.valueOf(request.getParameter("type"));
		Date date = Date.valueOf(request.getParameter("date"));
		String[] email = new String[nv.length];
		for (int i = 0; i < nv.length; i++) {
			Staffs st = std.getStaff(Integer.valueOf(nv[i]));
			Records rc = new Records(st, type, reason, date);
			if (rcd.insertRecord(rc)) {
				System.out.println("Them record thanh cong");
				email[i] = st.getEmail();
			} else {
				System.out.println("Them record that bai");
			}
		}
		if (send("Manager", email, date + "", reason, type)) {
			model.addAttribute("add", true);
			System.out.println("Gui email thanh cong");
		} else {
			System.out.println("Loi gui email");
		}
		return "records/add";
	}

	@RequestMapping(value = "staffs", method = RequestMethod.GET)
	public String getStaffsRecords(ModelMap model) {
		model.addAttribute("achievements", rcd.getStaffsRecords());
		model.addAttribute("menu", "records");
		return "records/staffs";
	}

	@RequestMapping(value = "departs", method = RequestMethod.GET)
	public String getDepartsRecords(ModelMap model) {
		model.addAttribute("departs", rcd.getDepartsRecords());
		model.addAttribute("menu", "records");
		return "records/departs";
	}

	@ModelAttribute("staffs")
	public Map<Integer, List<Staffs>> getStaffs() {
		Map<Integer, List<Staffs>> t = new HashMap<>();
		t = rcd.getStaffsInDeparts();
		return t;
	}

	@ModelAttribute("departs")
	public List<Departs> getDepartsName() {
		List<Departs> list = dpd.getDeparts();
		return list;
	}

	public boolean send(String from, String[] to, String date, String reason, int type) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			String subject = "Thông báo hoạt động " + date;
			String body = "";
			if (type == 1) {
				body = "Xin chúc mừng!<br/>Bạn được cộng một điểm thành tích vào " + date + " với lý do sau: <br/>\""
						+ reason + "\".";
				helper.setSubject(subject);
				helper.setText(body, true);
			} else {
				body = "Chào bạn!<br/>Bạn bị một điểm kỷ luật vào " + date + " với lý do sau: <br/>\"" + reason + "\"";
				helper.setSubject(subject);
				helper.setText(body, true);
			}

			mailer.send(mail);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@ModelAttribute("menu")
	public String getAside() {
		return "records";
	}

}

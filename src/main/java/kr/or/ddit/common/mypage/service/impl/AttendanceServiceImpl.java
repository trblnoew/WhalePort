package kr.or.ddit.common.mypage.service.impl;

import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.common.mypage.mapper.IAttendanceMapper;
import kr.or.ddit.common.mypage.service.IAttendanceService;
import kr.or.ddit.common.mypage.vo.EmpWorkVO;
import kr.or.ddit.util.security.CustomUser;


@Service
public class AttendanceServiceImpl implements IAttendanceService {

	@Inject
	private IAttendanceMapper attMapper;
	
	@Override
	public int insertWorkArrive(EmpWorkVO empWorkVO) {
		
		
		return attMapper.insertWorkArrive(empWorkVO);
	}

	@Override
	public EmpWorkVO selectWorkArrive(int workNo) {
		return attMapper.selectWorkArrive(workNo);
	}

	// 직원 근태 현황 조회
	@Override
	public EmpWorkVO selectEmpWork(LoginCommonVO loginCommonVO) {
		EmpWorkVO empWorkVO = attMapper.selectEmpWork(loginCommonVO);
		
		return empWorkVO;
	}
	
	@Override
	public int insertWorkLeave(EmpWorkVO empWorkVO) {
		// empWorkVO에 workArrive, empNo, workNo 들어있음
		
				 
		CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 LoginCommonVO loginCommonVO = auth.getMember();
		
		attMapper.insertWorkLeave(empWorkVO);
		
		
		String workArrive = empWorkVO.getWorkArrive(); // 2024-10-30 21:09:49
		String workLeave = attMapper.selectEmpWork(loginCommonVO).getWorkLeave();
		
		//출근 시, 분, 초
		String [] hMS1 = workArrive.split(" ")[1].split(":");
		int h1 = Integer.parseInt(hMS1[0]);
		int m1 = Integer.parseInt(hMS1[1]);
		int s1 = Integer.parseInt(hMS1[2]);
		
		//퇴근 시, 분, 초
		String [] hMS2 = workLeave.split(" ")[1].split(":");
		int h2 = Integer.parseInt(hMS2[0]);
		int m2 = Integer.parseInt(hMS2[1]);
		int s2 = Integer.parseInt(hMS2[2]);
		
		int H=0; // 일한 시간만
		int M=0; // 일한 분만
		
		if(m1 <= m2){
			M = m2-m1;
			H = h2-h1;
		}
		else{
			M = m2+60-m1;
			H = h2-h1-1; 
		}
		
		empWorkVO.setWorkTime(H+"시간"+M+"분");
		empWorkVO.setWorkAll(H*60+M);
		
		
		if(h1 <=9 &&  h2 >=18) {
			empWorkVO.setWorkNormal(1);
			empWorkVO.setWorkLate(0);
			empWorkVO.setWorkEarly(0);
			empWorkVO.setWorkOff(0);
			empWorkVO.setWorkNochk(0);
		}else if(h1 > 9 && h2 >= 18) {
			empWorkVO.setWorkNormal(0);
			empWorkVO.setWorkLate(1);
			empWorkVO.setWorkEarly(0);
			empWorkVO.setWorkOff(0);
			empWorkVO.setWorkNochk(0);
		}else {
			empWorkVO.setWorkNormal(0);
			empWorkVO.setWorkLate(0);
			empWorkVO.setWorkEarly(1);
			empWorkVO.setWorkOff(0);
			empWorkVO.setWorkNochk(0);
		}
		
		return attMapper.insertWorkLeave(empWorkVO);
	}

	@Override
	public List<EmpWorkVO> attendanceMonth(EmpWorkVO empWorkVO) {
		return attMapper.attendanceMonth(empWorkVO);
	}

	@Override
	public EmpWorkVO attendanceMonth1(EmpWorkVO empWorkVO) {
		return attMapper.attendanceMonth1(empWorkVO);
	}

	public EmpWorkVO attendanceMonth2(EmpWorkVO empWorkVO) {
		return attMapper.attendanceMonth2(empWorkVO);
	}

	@Override
	public EmpWorkVO attendanceMonth3(EmpWorkVO empWorkVO) {
		return attMapper.attendanceMonth3(empWorkVO);
	}

	@Override
	public EmpWorkVO attendanceMonth4(EmpWorkVO empWorkVO) {
		return attMapper.attendanceMonth4(empWorkVO);
	}

	@Override
	public EmpWorkVO attendanceMonth5(EmpWorkVO empWorkVO) {
		return attMapper.attendanceMonth5(empWorkVO);
	}

	@Override
	public List<EmpWorkVO> attendanceMonthDetail(EmpWorkVO empWorkVO) {
		return attMapper.attendanceMonthDetail(empWorkVO);
	}

	@Override
	public int insertTodayTime(EmpWorkVO empWorkVO) {
		return attMapper.insertTodayTime(empWorkVO);
	}




//	@Override
//	public String selectWorkNo(int empNo) {
//		return attMapper.selectWorkNo(empNo);
//	}
//
//
//	@Override
//	public int inputAttendance(EmpWorkVO empWorkVO) {
//		return attMapper.inputAttendance(empWorkVO);
//	}
//
//	@Override
//	public int insertWorkToday(EmpWorkVO empWorkVO) {
//		//empWorkVO에 empNo, workToday 들어있음
//		
//		int result = 0;
//		
//		String existingWork = attMapper.selectWorkToday(empWorkVO.getEmpNo()).getWorkToday();
//		
////		if(existingWork != null) { // 전날 데이터가 있음
//			String [] existingDate = existingWork.split(" ");
//			String [] workToday = empWorkVO.getWorkToday().split(" ");
//			for(int i=0; i<4; i++) { 
//				if(existingDate[i].equals(workToday[i])) {//오늘 데이터가 있음
//					result = 0;
//				}else {
//					result = attMapper.insertWorkToday(empWorkVO); ///1번
//				}
//			}
//			
////		}else { // 전날 데이터가 없음
////			result = attMapper.insertWorkToday(empWorkVO); ///2번
////		}
//		/// 기존 데이터 있을때 데이터 두번 들어가는거 햐결하고
//		/// 기존 출근 시간, 퇴근 시간도 해결하기..ㅠ 아마 오늘 날짜 가져오면 거기에 해당하는 workNo로 해결하면 될듯
//		
//		return result;
//	}



}

package kr.or.ddit.management.airService.customerManagement.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.reserve.meeting.vo.MeetingVO;
import kr.or.ddit.management.airService.customerManagement.mapper.MeetingReserveMapper;
import kr.or.ddit.management.airService.customerManagement.service.IMeetingReserveService;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MeetingReserveServiceImpl implements IMeetingReserveService{

	@Inject
	private MeetingReserveMapper mapper;
	
	@Override
	public int count(PaginationVO<MeetingVO> pagingVO) {
		log.info("# MeetingReserveServiceImpl count");
		return mapper.count(pagingVO);
	}

	@Override
	public List<MeetingVO> list(PaginationVO<MeetingVO> pagingVO) {
		log.info("# MeetingReserveServiceImpl list");
		return mapper.list(pagingVO);
	}

	@Override
	public void status(MeetingVO meetingVO) {
		log.info("# MeetingReserveServiceImpl status");
		mapper.status(meetingVO);
	}

	@Override
	public MeetingVO count1() {
		log.info("# MeetingReserveServiceImpl count1");
		return mapper.count1();
	}

	@Override
	public List<MeetingVO> selectMeetingReserveList() {
		return mapper.selectMeetingReserveList();
	}

	@Override
	public int selectAllRounge() {
		return mapper.selectAllRounge();
	}

	@Override
	public int selectTodayRounge() {
		return mapper.selectTodayRounge();
	}

	@Override
	public int selectNewRoungeList() {
		return mapper.selectNewRoungeList();
	}

	@Override
	public int selectCancelRoungeList() {
		return mapper.selectCancelRoungeList();
	}

	@Override
	public List<Integer> preReserNum() {
		return mapper.preReserNum();
	}

	@Override
	public List<Integer> thisReserNum() {
		return mapper.thisReserNum();
	}

}

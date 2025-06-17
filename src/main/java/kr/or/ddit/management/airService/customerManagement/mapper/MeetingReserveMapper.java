package kr.or.ddit.management.airService.customerManagement.mapper;

import java.util.List;

import kr.or.ddit.customer.reserve.meeting.vo.MeetingVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface MeetingReserveMapper {

	public int count(PaginationVO<MeetingVO> pagingVO);

	public List<MeetingVO> list(PaginationVO<MeetingVO> pagingVO);

	public void status(MeetingVO meetingVO);

	public MeetingVO count1();

	public List<MeetingVO> selectMeetingReserveList();

	public int selectAllRounge();

	public int selectTodayRounge();

	public int selectNewRoungeList();

	public int selectCancelRoungeList();

	public List<Integer> preReserNum();

	public List<Integer> thisReserNum();

}

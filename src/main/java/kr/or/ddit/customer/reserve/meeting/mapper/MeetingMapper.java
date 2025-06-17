package kr.or.ddit.customer.reserve.meeting.mapper;

import java.util.List;

import kr.or.ddit.customer.reserve.meeting.vo.MeetingVO;

public interface MeetingMapper {

	public List<MeetingVO> list();

	public MeetingVO select(int mrNo);

	public void register(MeetingVO meetingVO);

	public List<MeetingVO> check(MeetingVO meetingVO);

}

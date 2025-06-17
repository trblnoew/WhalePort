package kr.or.ddit.customer.reserve.meeting.service;

import java.util.List;

import kr.or.ddit.customer.reserve.meeting.vo.MeetingVO;

public interface IMeetingService {

	public List<MeetingVO> list();

	public MeetingVO select(int mrNo);

	public void register(MeetingVO meetingVO);

	public List<MeetingVO> check(MeetingVO meetingVO);

}

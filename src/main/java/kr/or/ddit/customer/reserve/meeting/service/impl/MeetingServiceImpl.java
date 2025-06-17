package kr.or.ddit.customer.reserve.meeting.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.reserve.meeting.mapper.MeetingMapper;
import kr.or.ddit.customer.reserve.meeting.service.IMeetingService;
import kr.or.ddit.customer.reserve.meeting.vo.MeetingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MeetingServiceImpl implements IMeetingService{

	@Inject
	private MeetingMapper mapper;
	
	@Override
	public List<MeetingVO> list() {
		log.info("# MeetingServiceImpl list");
		return mapper.list();
	}

	@Override
	public MeetingVO select(int mrNo) {
		log.info("# MeetingServiceImpl select");
		return mapper.select(mrNo);
	}

	@Override
	public void register(MeetingVO meetingVO) {
		log.info("# MeetingServiceImpl register");
		String[] mTime = meetingVO.getMrrTime().split(",");
		
		for(String mrrTime : mTime ) {
			meetingVO.setMrrTime(mrrTime);
			mapper.register(meetingVO);
		}
		
	}

	@Override
	public List<MeetingVO> check(MeetingVO meetingVO) {
		log.info("# MeetingServiceImpl check");
		return mapper.check(meetingVO);
	}

}

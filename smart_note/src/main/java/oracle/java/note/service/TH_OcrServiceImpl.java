package oracle.java.note.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.note.dao.TH_OcrDao;
@Service
public class TH_OcrServiceImpl implements TH_OcrService {
	@Autowired
	private TH_OcrDao ocrDao;
	
	@Override
	public int maxNoteId() {
		return ocrDao.maxNoteId();
	}

}

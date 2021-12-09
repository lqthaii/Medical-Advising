package service;

import model.Question;
import repository.QuestionRepository;

import java.io.InputStream;
import java.util.List;

public class QuestionService{
    QuestionRepository questionRepository = new QuestionRepository();
    public boolean uploadQuestion(int id, String question, String title, String timeQuestion){
        return this.questionRepository.uploadQuestion(id,question,title,timeQuestion);
    }
    public List<Question> getAllQuestionNoReply() {
        return this.questionRepository.getAllQuestionNoReply();
    }
    public Question getQuestion(int id) {
        return this.questionRepository.getQuestion(id);
    }
    public boolean updateQuestion(Question question){
        return this.questionRepository.updateQuestion(question);
    }
    public List<Question> getAllQuestionReply() {
        return this.questionRepository.getAllQuestionReply();
    }
}

package model;

public class Question {
    int id;
    String title;
    Customer customer;
    Doctor doctor;
    int status;
    String question;
    String answer;
    String timeQuestion;
    String timeAnswer;

    public Question() {
    }

    public Question(int id, String title, Customer customer, Doctor doctor, int status, String question, String answer, String timeQuestion, String timeAnswer) {
        this.id = id;
        this.title = title;
        this.customer = customer;
        this.doctor = doctor;
        this.status = status;
        this.question = question;
        this.answer = answer;
        this.timeQuestion = timeQuestion;
        this.timeAnswer = timeAnswer;
    }

    public String getTimeQuestion() {
        return timeQuestion;
    }

    public void setTimeQuestion(String timeQuestion) {
        this.timeQuestion = timeQuestion;
    }

    public String getTimeAnswer() {
        return timeAnswer;
    }

    public void setTimeAnswer(String timeAnswer) {
        this.timeAnswer = timeAnswer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}

package service;

import model.Doctor;
import repository.DoctorRepository;

public class DoctorService {
    DoctorRepository doctorRepository = new DoctorRepository();
    public Doctor getDoctor(int id) {
        return this.doctorRepository.getDoctor(id);
    }
}

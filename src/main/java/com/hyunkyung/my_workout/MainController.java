package com.hyunkyung.my_workout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private WorkoutRepository workoutRepository;

    @GetMapping("/")
    public String index(Model model) {
        List<Workout> workouts = workoutRepository.findAll();
        model.addAttribute("workouts", workouts);
        return "index";
    }

    @PostMapping("/add")
    public String saveWorkout(@RequestParam("name") String name, @RequestParam("weight") Integer weight) {
        Workout workout = new Workout();
        workout.setName(name);
        workout.setWeight(weight);
        workoutRepository.save(workout);
        return "redirect:/";
    }
}
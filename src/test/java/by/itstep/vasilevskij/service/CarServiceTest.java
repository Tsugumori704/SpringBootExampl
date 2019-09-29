package by.itstep.vasilevskij.service;

import by.itstep.vasilevskij.domain.Car;
import by.itstep.vasilevskij.repository.CarRepo;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CarServiceTest {

    @Autowired
    CarService carService;

    @MockBean
    CarRepo carRepo;

    private Car carOne;
    private Car carTwo;

    @Before
    public void setUp() throws Exception {
        carOne = new Car();
        carOne.setMark("VW");
        carOne.setModel("Polo");
        carOne.setColor("red");
        carOne.setVin("10a69e25djt89cnth");
        carOne.setDeleted(false);

        carTwo = new Car();
        carTwo.setMark("VW");
        carTwo.setModel("Golf");
        carTwo.setColor("Green");
        carTwo.setVin("20a69e25djt89c47h");
        carTwo.setDeleted(true);
    }

    @Test
    public void saveCarTestNewCarPositive() {
        Mockito.when(carRepo.findByVin(carOne.getVin())).thenReturn(null);
        boolean carIsSaved = carService.saveCar(carOne);
        Assert.assertTrue(carIsSaved);
    }

    @Test
    public void saveCarTestNewCarNegative() {
        Mockito.when(carRepo.findByVin(carOne.getVin())).thenReturn(carOne);
        boolean carIsSaved = carService.saveCar(carOne);
        Assert.assertFalse(carIsSaved);
    }

    @Test
    public void saveCarTestExistedCarsWithChangeVinPositiveOne() {
        carOne.setId(1L);
        Mockito.when(carRepo.findByVin(carOne.getVin())).thenReturn(carOne);
        boolean carIsSaved = carService.saveCar(carOne);
        Assert.assertTrue(carIsSaved);
    }

    @Test
    public void saveCarTestExistedCarsWithChangeVinPositiveTwo() {
        carOne.setId(1L);
        Mockito.when(carRepo.findByVin(carOne.getVin())).thenReturn(null);
        boolean carIsSaved = carService.saveCar(carOne);
        Assert.assertTrue(carIsSaved);
    }

    @Test
    public void saveCarTestExistedCarsWithChangeVinAndNotChangeVinNegative() {
        carOne.setId(1L);
        carTwo.setVin(carOne.getVin());
        Mockito.when(carRepo.findByVin(carOne.getVin())).thenReturn(carTwo);
        boolean carIsSaved = carService.saveCar(carOne);
        Assert.assertFalse(carIsSaved);
    }

    @Test
    public void getAll() {

    }

    @Test
    public void remove() {
        carService.remove(carOne);
        Assert.assertTrue(carOne.isDeleted());
    }

    @Test
    public void reaper() {
        carService.reaper(carTwo);
        Assert.assertFalse(carTwo.isDeleted());
    }
}
package tourism;

import com.tourism.model.TravelPackage;
import com.tourism.service.PackageService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class PackageLoadingTest {

    @Autowired
    private PackageService packageService;

    @Test
    void testGetAllPackages() {
        List<TravelPackage> packages = packageService.getAllPackages();
        assertNotNull(packages, "Packages list should not be null");
        assertFalse(packages.isEmpty(), "Packages list should not be empty. Check if data/packages.txt exists and has data.");
        
        System.out.println("Loaded " + packages.size() + " packages.");
        for (TravelPackage pkg : packages) {
            System.out.println("- " + pkg.getName() + " (" + pkg.getDestination() + ")");
        }
    }
}

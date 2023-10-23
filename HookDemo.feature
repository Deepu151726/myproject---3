@all
Feature: Testing on NinaDemo application

Background:
Given I am on tutorialsNinja Homepage

@regression
Scenario:
Then I enter Input for the search box
And I click on search button
And I close browser

@regression
Scenario:

And I click on Add to Cart button
And I close browser

@db
Scenario:

And I click on Checkout button
And I close browser
===========================================================
package steps;

import io.cucumber.java.After;
import io.cucumber.java.Before;

public class HookTestDemo {
	
	
	// Suppose you have a feature file which has some scenarios, and before executeing those scenarios if
	// you want to run this setup() method then give @Before annotation
	
	@Before(order = 0,value="@regression")
	public void setup()
	{
		System.out.println("Executing only regression scenarios");
		System.out.println("The feature sceanrio has started");
		System.out.println("The Author is admin");
		
	}
	@Before(order = 1,value="@db")
	public void Dbsetup()
	{
		System.out.println("Connect to DB");
	}
	
	// Suppose you have a feature file which has some scenarios, and after executing those scenarios if
		// you want to run this teardown() method then give @After annotation
		
	@After(order = 1,value="@db")
	public void DbClose()
	{
		System.out.println("Close the DB connection");
	}

	@After(order = 0,value="@regression")
	public void teardown()
	{
		
		System.out.println("The feature sceanrio has completed");
		
	}
}


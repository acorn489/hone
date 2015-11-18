# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

student = Student.create(username: 'Husseny', password: '1234', email: 'husseny@123')
developer = Developer.create(username: 'Marco', password: '1234', email: 'marco@123')

courses = Course.create([{title: 'Mathematics', description: 'This is a course to teach Maths to grades 1 and 2 using the common core standards.'}, {title: 'English', description: 'This is an English course that is taught using the common core standards.'}])

domain = Domain.new(title: 'Operations & Algebric Thinking', screening_title: 'Think like a Calculator', description: 'A long description here')
domain.course = Course.first
domain.save

domain = Domain.new(title: 'Numbers & Operations in Base Ten', screening_title: 'Numbers Madness', description: 'A long description here')
domain.course = Course.first
domain.save

domain = Domain.new(title: 'Measurement and Data', screening_title: 'The Millimeter Difference', description: 'A long description here')
domain.course = Course.first
domain.save

domain = Domain.new(title: 'Geometry', screening_title: 'Shapes', description: 'A long description here')
domain.course = Course.first
domain.save

skill = Skill.new(title: 'addition and subtraction within 20', description: 'Use addition and subtraction within 20 to solve word problems involving situations of adding to, taking from, putting together, taking apart, and comparing, with unknowns in all positions, e.g., by using objects, drawings, and equations with a symbol for the unknown number to represent the problem.', grade: 1, level: 1, locked_skill_id: 2)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Word problems that call for addition within 20', description: 'Solve word problems that call for addition of three whole numbers whose sum is less than or equal to 20, e.g., by using objects, drawings, and equations with a symbol for the unknown number to represent the problem.', grade: 1, level: 2, locked_skill_id: 0)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Apply properties of operations as strategies to add and subtract.', description: 'Apply properties of operations as strategies to add and subtract.2 Examples: If 8 + 3 = 11 is known, then 3 + 8 = 11 is also known. (Commutative property of addition.) To add 2 + 6 + 4, the second two numbers can be added to make a ten, so 2 + 6 + 4 = 2 + 10 = 12. (Associative property of addition.)', grade: 1, level: 1, locked_skill_id: 4)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Understand subtraction as an unknown-addend problem.', description: 'Understand subtraction as an unknown-addend problem. For example, subtract 10 - 8 by finding the number that makes 10 when added to 8.', grade: 1, level: 2, locked_skill_id: 0)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Relate counting to addition and subtraction', description: 'Relate counting to addition and subtraction (e.g., by counting on 2 to add 2).', grade: 1, level: 1, locked_skill_id: 6)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Add and subtract within 20, demonstrating fluency for addition and subtraction within 10.', description: 'Add and subtract within 20, demonstrating fluency for addition and subtraction within 10. Use strategies such as counting on; making ten (e.g., 8 + 6 = 8 + 2 + 4 = 10 + 4 = 14); decomposing a number leading to a ten (e.g., 13 - 4 = 13 - 3 - 1 = 10 - 1 = 9); using the relationship between addition and subtraction (e.g., knowing that 8 + 4 = 12, one knows 12 - 8 = 4); and creating equivalent but easier or known sums (e.g., adding 6 + 7 by creating the known equivalent 6 + 6 + 1 = 12 + 1 = 13).', grade: 1, level: 2, locked_skill_id: 0)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Understand the meaning of the equal sign', description: 'Understand the meaning of the equal sign, and determine if equations involving addition and subtraction are true or false. For example, which of the following equations are true and which are false? 6 = 6, 7 = 8 - 1, 5 + 2 = 2 + 5, 4 + 1 = 5 + 2.', grade: 1, level: 1, locked_skill_id: 8)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Determine the unknown whole number in an addition or subtraction equation', description: 'Determine the unknown whole number in an addition or subtraction equation relating three whole numbers. For example, determine the unknown number that makes the equation true in each of the equations 8 + ? = 11, 5 = _ - 3, 6 + 6 = _.', grade: 1, level: 2, locked_skill_id: 0)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Count to 120', description: 'Count to 120, starting at any number less than 120. In this range, read and write numerals and represent a number of objects with a written numeral.', grade: 1, level: 1, locked_skill_id: 0)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Understand that the two digits of a two-digit number', description: 'Understand that the two digits of a two-digit number represent amounts of tens and ones. Understand the following as special cases: A) 10 can be thought of as a bundle of ten ones — called a "ten." B)The numbers from 11 to 19 are composed of a ten and one, two, three, four, five, six, seven, eight, or nine ones. C) The numbers 10, 20, 30, 40, 50, 60, 70, 80, 90 refer to one, two, three, four, five, six, seven, eight, or nine tens (and 0 ones).', grade: 1, level: 1, locked_skill_id: 11)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Compare two two-digit numbers', description: 'Compare two two-digit numbers based on meanings of the tens and ones digits, recording the results of comparisons with the symbols >, =, and <.', grade: 1, level: 2, locked_skill_id: 0)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Add within 100, including adding a two-digit number and a one-digit number, and adding a two-digit number and a multiple of 10', description: 'Add within 100, including adding a two-digit number and a one-digit number, and adding a two-digit number and a multiple of 10, using concrete models or drawings and strategies based on place value, properties of operations, and/or the relationship between addition and subtraction; relate the strategy to a written method and explain the reasoning used. Understand that in adding two-digit numbers, one adds tens and tens, ones and ones; and sometimes it is necessary to compose a ten.', grade: 1, level: 1, locked_skill_id: 13)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Find 10 more or 10 less than the number', description: 'Given a two-digit number, mentally find 10 more or 10 less than the number, without having to count; explain the reasoning used.', grade: 1, level: 2, locked_skill_id: 14)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Subtract multiples of 10 in the range 10-90 from multiples of 10 in the range 10-90', description: 'Subtract multiples of 10 in the range 10-90 from multiples of 10 in the range 10-90 (positive or zero differences), using concrete models or drawings and strategies based on place value, properties of operations, and/or the relationship between addition and subtraction; relate the strategy to a written method and explain the reasoning used.', grade: 1, level: 3, locked_skill_id: 0)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Order three objects by length', description: 'Order three objects by length; compare the lengths of two objects indirectly by using a third object.', grade: 1, level: 1, locked_skill_id: 16)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Express the length of an object as a whole number of length units', description: 'Express the length of an object as a whole number of length units, by laying multiple copies of a shorter object (the length unit) end to end; understand that the length measurement of an object is the number of same-size length units that span it with no gaps or overlaps. Limit to contexts where the object being measured is spanned by a whole number of length units with no gaps or overlaps.', grade: 1, level: 2, locked_skill_id: 0)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Tell and write time in hours and half-hours', description: 'Tell and write time in hours and half-hours using analog and digital clocks.', grade: 1, level: 1, locked_skill_id: 0)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Organize, represent, and interpret data with up to three categories', description: 'Organize, represent, and interpret data with up to three categories; ask and answer questions about the total number of data points, how many in each category, and how many more or less are in one category than in another.', grade: 1, level: 1, locked_skill_id: 0)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Distinguish between defining and non-defining attributes for shapes', description: 'Distinguish between defining attributes (e.g., triangles are closed and three-sided) versus non-defining attributes (e.g., color, orientation, overall size); build and draw shapes to possess defining attributes.', grade: 1, level: 1, locked_skill_id: 0)
skill.domain = Domain.fourth
skill.save

skill = Skill.new(title: 'Compose two-dimensional shapes or three-dimensional shapes to create a composite shape', description: 'Compose two-dimensional shapes (rectangles, squares, trapezoids, triangles, half-circles, and quarter-circles) or three-dimensional shapes (cubes, right rectangular prisms, right circular cones, and right circular cylinders) to create a composite shape, and compose new shapes from the composite shape.Students should apply the principle of transitivity of measurement to make indrirect comparisons, but they need not use this technical term', grade: 1, level: 1, locked_skill_id: 0)
skill.domain = Domain.fourth
skill.save

skill = Skill.new(title: 'Partition circles and rectangles into two and four equal shares', description: 'Partition circles and rectangles into two and four equal shares, describe the shares using the words halves, fourths, and quarters, and use the phrases half of, fourth of, and quarter of. Describe the whole as two of, or four of the shares. Understand for these examples that decomposing into more equal shares creates smaller shares.', grade: 1, level: 1, locked_skill_id: 0)
skill.domain = Domain.fourth
skill.save

skill = Skill.new(title: 'Use addition and subtraction within 100 to solve one- and two-step word problems', description: 'Use addition and subtraction within 100 to solve one- and two-step word problems involving situations of adding to, taking from, putting together, taking apart, and comparing, with unknowns in all positions, e.g., by using drawings and equations with a symbol for the unknown number to represent the problem.', grade: 2, level: 4, locked_skill_id: 0)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Fluently add and subtract within 20 using mental strategies', description: 'Fluently add and subtract within 20 using mental strategies.By the end, know from memory all sums of two one-digit numbers.', grade: 2, level: 4, locked_skill_id: 0)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Determine whether a group of objects has an odd or even number of members', description: 'Determine whether a group of objects (up to 20) has an odd or even number of members, e.g., by pairing objects or counting them by 2s; write an equation to express an even number as a sum of two equal addends.', grade: 2, level: 4, locked_skill_id: 25)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'Use addition to find the total number of objects arranged', description: 'Use addition to find the total number of objects arranged in rectangular arrays with up to 5 rows and up to 5 columns; write an equation to express the total as a sum of equal addends.', grade: 2, level: 5, locked_skill_id: 0)
skill.domain = Domain.first
skill.save

skill = Skill.new(title: 'A three-digit number represent amounts of hundreds, tens, and ones', description: 'Understand that the three digits of a three-digit number represent amounts of hundreds, tens, and ones; e.g., 706 equals 7 hundreds, 0 tens, and 6 ones. Understand the following as special cases: A) 100 can be thought of as a bundle of ten tens — called a "hundred." B) The numbers 100, 200, 300, 400, 500, 600, 700, 800, 900 refer to one, two, three, four, five, six, seven, eight, or nine hundreds (and 0 tens and 0 ones).', grade: 2, level: 4, locked_skill_id: 27)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Count within 1000', description: 'Count within 1000; skip-count by 5s, 10s, and 100s.', grade: 2, level: 5, locked_skill_id: 28)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Read and write numbers to 1000', description: 'Read and write numbers to 1000 using base-ten numerals, number names, and expanded form.', grade: 2, level: 6, locked_skill_id: 29)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Compare two three-digit numbers', description: 'Compare two three-digit numbers based on meanings of the hundreds, tens, and ones digits, using >, =, and < symbols to record the results of comparisons.', grade: 2, level: 7, locked_skill_id: 0)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Fluently add and subtract within 100', description: 'Fluently add and subtract within 100 using strategies based on place value, properties of operations, and/or the relationship between addition and subtraction.', grade: 2, level: 4, locked_skill_id: 31)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Add up to four two-digit numbers', description: 'Add up to four two-digit numbers using strategies based on place value and properties of operations.', grade: 2, level: 5, locked_skill_id: 32)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Add and subtract within 1000, using concrete models or drawings', description: 'Add and subtract within 1000, using concrete models or drawings and strategies based on place value, properties of operations, and/or the relationship between addition and subtraction; relate the strategy to a written method. Understand that in adding or subtracting three-digit numbers, one adds or subtracts hundreds and hundreds, tens and tens, ones and ones; and sometimes it is necessary to compose or decompose tens or hundreds.', grade: 2, level: 6, locked_skill_id: 33)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Mental addition and subtraction', description: 'Mentally add 10 or 100 to a given number 100-900, and mentally subtract 10 or 100 from a given number 100-900.', grade: 2, level: 7, locked_skill_id: 34)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Explain why addition and subtraction strategies work', description: 'Explain why addition and subtraction strategies work, using place value and the properties of operations.', grade: 2, level: 8, locked_skill_id: 0)
skill.domain = Domain.second
skill.save

skill = Skill.new(title: 'Measuring lengths using tools', description: 'Measure the length of an object by selecting and using appropriate tools such as rulers, yardsticks, meter sticks, and measuring tapes.', grade: 2, level: 4, locked_skill_id: 36)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Measuring lengths using different length units', description: 'Measure the length of an object twice, using length units of different lengths for the two measurements; describe how the two measurements relate to the size of the unit chosen.', grade: 2, level: 5, locked_skill_id: 37)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Length estimation', description: 'Estimate lengths using units of inches, feet, centimeters, and meters.', grade: 2, level: 6, locked_skill_id: 38)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Length comparison', description: 'Measure to determine how much longer one object is than another, expressing the length difference in terms of a standard length unit.', grade: 2, level: 7, locked_skill_id: 0)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Add and subtract within 100 to solve word problems involving lengths', description: 'Use addition and subtraction within 100 to solve word problems involving lengths that are given in the same units, e.g., by using drawings (such as drawings of rulers) and equations with a symbol for the unknown number to represent the problem.', grade: 2, level: 4, locked_skill_id: 40)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Represent whole numbers as lengths', description: 'Represent whole numbers as lengths from 0 on a number line diagram with equally spaced points corresponding to the numbers 0, 1, 2, ..., and represent whole-number sums and differences within 100 on a number line diagram.', grade: 2, level: 5, locked_skill_id: 0)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Tell and write time from analog and digital clocks to the nearest five minutes', description: 'Tell and write time from analog and digital clocks to the nearest five minutes, using a.m. and p.m', grade: 2, level: 4, locked_skill_id: 42)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Solve word problems involving money', description: 'Solve word problems involving dollar bills, quarters, dimes, nickels, and pennies, using $ and ¢ symbols appropriately. Example: If you have 2 dimes and 3 pennies, how many cents do you have?', grade: 2, level: 5, locked_skill_id: 0)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Measuring lengths of several objects to the nearest whole unit', description: 'Generate measurement data by measuring lengths of several objects to the nearest whole unit, or by making repeated measurements of the same object. Show the measurements by making a line plot, where the horizontal scale is marked off in whole-number units.', grade: 2, level: 4, locked_skill_id: 44)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Draw a picture graph and a bar graph to represent a data set', description: 'Draw a picture graph and a bar graph (with single-unit scale) to represent a data set with up to four categories. Solve simple put-together, take-apart, and compare problems1 using information presented in a bar graph.', grade: 2, level: 5, locked_skill_id: 0)
skill.domain = Domain.third
skill.save

skill = Skill.new(title: 'Recognize and draw shapes having specified attributes', description: 'Recognize and draw shapes having specified attributes, such as a given number of angles or a given number of equal faces. Identify triangles, quadrilaterals, pentagons, hexagons, and cubes. Sizes are compared directly or visually, not compared by measuring.', grade: 2, level: 4, locked_skill_id: 46)
skill.domain = Domain.fourth
skill.save

skill = Skill.new(title: 'Partition a rectangle into rows and columns', description: 'Partition a rectangle into rows and columns of same-size squares and count to find the total number of them.', grade: 2, level: 5, locked_skill_id: 47)
skill.domain = Domain.fourth
skill.save

skill = Skill.new(title: 'Partition circles and rectangles into two, three, or four equal shares', description: 'Partition circles and rectangles into two, three, or four equal shares, describe the shares using the words halves, thirds, half of, a third of, etc., and describe the whole as two halves, three thirds, four fourths. Recognize that equal shares of identical wholes need not have the same shape.', grade: 2, level: 6, locked_skill_id: 38)
skill.domain = Domain.fourth
skill.save



game = Game.new(title: 'Maths Man', description: 'A long description here', platform: 1, link: 'https://play.google.com/store/apps/details?id=com.gadoworld.mathman', status: 1, passing_score: 5)
game.primary_skill = Skill.first
game.save

game = Game.new(title: 'Maths Man 2', description: 'A long description here', platform: 1, link: 'https://play.google.com/store/apps/details?id=com.gadoworld.mathman', status: 1, passing_score: 5)
game.primary_skill = Skill.second
game.save

game = Game.new(title: 'Build a tower', description: 'A long description here', platform: 1, link: 'https://play.google.com/store/apps/details?id=org.altervista.luma23.towerNumber', status: 1, passing_score: 5)
game.primary_skill = Skill.third
game.secondary_skill = Skill.second
game.save

game = Game.new(title: 'Build a tower 2', description: 'A long description here', platform: 1, link: 'https://play.google.com/store/apps/details?id=org.altervista.luma23.towerNumber', status: 1, passing_score: 5)
game.primary_skill = Skill.fourth
game.secondary_skill = Skill.second
game.save


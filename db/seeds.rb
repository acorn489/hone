# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
student1 = seed Student, {username: 'husseny', name: 'Husseny', email: 'husseny@web.de'}, {password: '12341234', password_confirmation: '12341234'}
student2 = seed Student, {username: 'student', name: 'student', email: 'student@web.de'}, {password: '12341234', password_confirmation: '12341234'}
seed Developer, {username: 'marco', name: 'Marco', email: 'marco@web.de'}, {password: '12341234', password_confirmation: '12341234'}
seed Admin, {username: 'administrator', name: 'Admin', email: 'admin@web.de'}, {password: '12341234', password_confirmation: '12341234'}

seed Course, {title: 'Mathematics', description: 'This is a course to teach Maths to grades 1 and 2 using the common core standards.'}
seed Course, {title: 'English', description: 'This is an English course that is taught using the common core standards.'}

seed Domain, {title: 'Operations & Algebric Thinking', screening_title: 'Think like a Calculator', description: 'A long description here', course: Course.first}
seed Domain, {title: 'Numbers & Operations in Base Ten', screening_title: 'Numbers Madness', description: 'A long description here', course: Course.first}
seed Domain, {title: 'Measurement and Data', screening_title: 'The Millimeter Difference', description: 'A long description here', course: Course.first}
seed Domain, {title: 'Geometry', screening_title: 'Shapes', description: 'A long description here', course: Course.first}

skill1 = seed Skill, {description: 'Use addition and subtraction within 20 to solve word problems involving situations of adding to, taking from, putting together, taking apart, and comparing, with unknowns in all positions, e.g., by using objects, drawings, and equations with a symbol for the unknown number to represent the problem.', grade: 1, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.1.OA.A.1'}
skill2 = seed Skill, {description: 'Solve word problems that call for addition of three whole numbers whose sum is less than or equal to 20, e.g., by using objects, drawings, and equations with a symbol for the unknown number to represent the problem.', grade: 1, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.1.OA.A.2'}
seed Skill, {description: 'Apply properties of operations as strategies to add and subtract.2 Examples: If 8 + 3 = 11 is known, then 3 + 8 = 11 is also known. (Commutative property of addition.) To add 2 + 6 + 4, the second two numbers can be added to make a ten, so 2 + 6 + 4 = 2 + 10 = 12. (Associative property of addition.)', grade: 1, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.1.OA.B.3'}
seed Skill, {description: 'Understand subtraction as an unknown-addend problem. For example, subtract 10 - 8 by finding the number that makes 10 when added to 8.', grade: 1, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.1.OA.B.4'}
seed Skill, {description: 'Relate counting to addition and subtraction (e.g., by counting on 2 to add 2).', grade: 1, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.1.OA.C.5'}
seed Skill, {description: 'Add and subtract within 20, demonstrating fluency for addition and subtraction within 10. Use strategies such as counting on; making ten (e.g., 8 + 6 = 8 + 2 + 4 = 10 + 4 = 14); decomposing a number leading to a ten (e.g., 13 - 4 = 13 - 3 - 1 = 10 - 1 = 9); using the relationship between addition and subtraction (e.g., knowing that 8 + 4 = 12, one knows 12 - 8 = 4); and creating equivalent but easier or known sums (e.g., adding 6 + 7 by creating the known equivalent 6 + 6 + 1 = 12 + 1 = 13).', grade: 1, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.1.OA.C.6'}
seed Skill, {description: 'Understand the meaning of the equal sign, and determine if equations involving addition and subtraction are true or false. For example, which of the following equations are true and which are false? 6 = 6, 7 = 8 - 1, 5 + 2 = 2 + 5, 4 + 1 = 5 + 2.', grade: 1, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.1.OA.D.7'}
seed Skill, {description: 'Determine the unknown whole number in an addition or subtraction equation relating three whole numbers. For example, determine the unknown number that makes the equation true in each of the equations 8 + ? = 11, 5 = _ - 3, 6 + 6 = _.', grade: 1, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.1.OA.D.8'}
seed Skill, {description: 'Count to 120, starting at any number less than 120. In this range, read and write numerals and represent a number of objects with a written numeral.', grade: 1, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.1.NBT.A.1'}
seed Skill, {description: 'Understand that the two digits of a two-digit number represent amounts of tens and ones. Understand the following as special cases: A) 10 can be thought of as a bundle of ten ones — called a "ten." B)The numbers from 11 to 19 are composed of a ten and one, two, three, four, five, six, seven, eight, or nine ones. C) The numbers 10, 20, 30, 40, 50, 60, 70, 80, 90 refer to one, two, three, four, five, six, seven, eight, or nine tens (and 0 ones).', grade: 1, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.1.NBT.B.2'}
seed Skill, {description: 'Compare two two-digit numbers based on meanings of the tens and ones digits, recording the results of comparisons with the symbols >, =, and <.', grade: 1, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.1.NBT.B.3'}
seed Skill, {description: 'Add within 100, including adding a two-digit number and a one-digit number, and adding a two-digit number and a multiple of 10, using concrete models or drawings and strategies based on place value, properties of operations, and/or the relationship between addition and subtraction; relate the strategy to a written method and explain the reasoning used. Understand that in adding two-digit numbers, one adds tens and tens, ones and ones; and sometimes it is necessary to compose a ten.', grade: 1, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.1.NBT.C.4'}
seed Skill, {description: 'Given a two-digit number, mentally find 10 more or 10 less than the number, without having to count; explain the reasoning used.', grade: 1, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.1.NBT.C.5'}
seed Skill, {description: 'Subtract multiples of 10 in the range 10-90 from multiples of 10 in the range 10-90 (positive or zero differences), using concrete models or drawings and strategies based on place value, properties of operations, and/or the relationship between addition and subtraction; relate the strategy to a written method and explain the reasoning used.', grade: 1, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.1.NBT.C.6'}
seed Skill, {description: 'Order three objects by length; compare the lengths of two objects indirectly by using a third object.', grade: 1, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.1.MD.A.1'}
seed Skill, {description: 'Express the length of an object as a whole number of length units, by laying multiple copies of a shorter object (the length unit) end to end; understand that the length measurement of an object is the number of same-size length units that span it with no gaps or overlaps. Limit to contexts where the object being measured is spanned by a whole number of length units with no gaps or overlaps.', grade: 1, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.1.MD.A.2'}
seed Skill, {description: 'Tell and write time in hours and half-hours using analog and digital clocks.', grade: 1, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.1.MD.B.3'}
seed Skill, {description: 'Organize, represent, and interpret data with up to three categories; ask and answer questions about the total number of data points, how many in each category, and how many more or less are in one category than in another.', grade: 1, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.1.MD.C.4'}
seed Skill, {description: 'Distinguish between defining attributes (e.g., triangles are closed and three-sided) versus non-defining attributes (e.g., color, orientation, overall size); build and draw shapes to possess defining attributes.', grade: 1, domain: Domain.fourth, course: Course.first}, {title: 'CCSS.Math.Content.1.G.A.1'}
seed Skill, {description: 'Compose two-dimensional shapes (rectangles, squares, trapezoids, triangles, half-circles, and quarter-circles) or three-dimensional shapes (cubes, right rectangular prisms, right circular cones, and right circular cylinders) to create a composite shape, and compose new shapes from the composite shape.Students should apply the principle of transitivity of measurement to make indrirect comparisons, but they need not use this technical term', grade: 1, domain: Domain.fourth, course: Course.first}, {title: 'CCSS.Math.Content.1.G.A.2'}
seed Skill, {description: 'Partition circles and rectangles into two and four equal shares, describe the shares using the words halves, fourths, and quarters, and use the phrases half of, fourth of, and quarter of. Describe the whole as two of, or four of the shares. Understand for these examples that decomposing into more equal shares creates smaller shares.', grade: 1, domain: Domain.fourth, course: Course.first}, {title: 'CCSS.Math.Content.1.G.A.3'}
seed Skill, {description: 'Use addition and subtraction within 100 to solve one- and two-step word problems involving situations of adding to, taking from, putting together, taking apart, and comparing, with unknowns in all positions, e.g., by using drawings and equations with a symbol for the unknown number to represent the problem.', grade: 2, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.2.OA.A.1'}
seed Skill, {description: 'Fluently add and subtract within 20 using mental strategies.By the end, know from memory all sums of two one-digit numbers.', grade: 2, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.2.OA.B.2'}
seed Skill, {description: 'Determine whether a group of objects (up to 20) has an odd or even number of members, e.g., by pairing objects or counting them by 2s; write an equation to express an even number as a sum of two equal addends.', grade: 2, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.2.OA.C.3'}
seed Skill, {description: 'Use addition to find the total number of objects arranged in rectangular arrays with up to 5 rows and up to 5 columns; write an equation to express the total as a sum of equal addends.', grade: 2, domain: Domain.first, course: Course.first}, {title: 'CCSS.Math.Content.2.OA.C.4'}
seed Skill, {description: 'Understand that the three digits of a three-digit number represent amounts of hundreds, tens, and ones; e.g., 706 equals 7 hundreds, 0 tens, and 6 ones. Understand the following as special cases: A) 100 can be thought of as a bundle of ten tens — called a "hundred." B) The numbers 100, 200, 300, 400, 500, 600, 700, 800, 900 refer to one, two, three, four, five, six, seven, eight, or nine hundreds (and 0 tens and 0 ones).', grade: 2, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.2.NBT.A.1'}
seed Skill, {description: 'Count within 1000; skip-count by 5s, 10s, and 100s.', grade: 2, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.2.NBT.A.2'}
seed Skill, {description: 'Read and write numbers to 1000 using base-ten numerals, number names, and expanded form.', grade: 2, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.2.NBT.A.3'}
seed Skill, {description: 'Compare two three-digit numbers based on meanings of the hundreds, tens, and ones digits, using >, =, and < symbols to record the results of comparisons.', grade: 2, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.2.NBT.A.4'}
seed Skill, {description: 'Fluently add and subtract within 100 using strategies based on place value, properties of operations, and/or the relationship between addition and subtraction.', grade: 2, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.2.NBT.B.5'}
seed Skill, {description: 'Add up to four two-digit numbers using strategies based on place value and properties of operations.', grade: 2, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.2.NBT.B.6'}
seed Skill, {description: 'Add and subtract within 1000, using concrete models or drawings and strategies based on place value, properties of operations, and/or the relationship between addition and subtraction; relate the strategy to a written method. Understand that in adding or subtracting three-digit numbers, one adds or subtracts hundreds and hundreds, tens and tens, ones and ones; and sometimes it is necessary to compose or decompose tens or hundreds.', grade: 2, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.2.NBT.B.7'}
seed Skill, {description: 'Mentally add 10 or 100 to a given number 100-900, and mentally subtract 10 or 100 from a given number 100-900.', grade: 2, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.2.NBT.B.8'}
seed Skill, {description: 'Explain why addition and subtraction strategies work, using place value and the properties of operations.', grade: 2, domain: Domain.second, course: Course.first}, {title: 'CCSS.Math.Content.2.NBT.B.9'}
seed Skill, {description: 'Measure the length of an object by selecting and using appropriate tools such as rulers, yardsticks, meter sticks, and measuring tapes.', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.A.1'}
seed Skill, {description: 'Measure the length of an object twice, using length units of different lengths for the two measurements; describe how the two measurements relate to the size of the unit chosen.', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.A.2'}
seed Skill, {description: 'Estimate lengths using units of inches, feet, centimeters, and meters.', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.A.3'}
seed Skill, {description: 'Measure to determine how much longer one object is than another, expressing the length difference in terms of a standard length unit.', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.A.4'}
seed Skill, {description: 'Use addition and subtraction within 100 to solve word problems involving lengths that are given in the same units, e.g., by using drawings (such as drawings of rulers) and equations with a symbol for the unknown number to represent the problem.', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.B.5'}
seed Skill, {description: 'Represent whole numbers as lengths from 0 on a number line diagram with equally spaced points corresponding to the numbers 0, 1, 2, ..., and represent whole-number sums and differences within 100 on a number line diagram.', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.B.6'}
seed Skill, {description: 'Tell and write time from analog and digital clocks to the nearest five minutes, using a.m. and p.m', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.C.7'}
seed Skill, {description: 'Solve word problems involving dollar bills, quarters, dimes, nickels, and pennies, using $ and ¢ symbols appropriately. Example: If you have 2 dimes and 3 pennies, how many cents do you have?', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.C.8'}
seed Skill, {description: 'Generate measurement data by measuring lengths of several objects to the nearest whole unit, or by making repeated measurements of the same object. Show the measurements by making a line plot, where the horizontal scale is marked off in whole-number units.', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.D.9'}
seed Skill, {description: 'Draw a picture graph and a bar graph (with single-unit scale) to represent a data set with up to four categories. Solve simple put-together, take-apart, and compare problems1 using information presented in a bar graph.', grade: 2, domain: Domain.third, course: Course.first}, {title: 'CCSS.Math.Content.2.MD.D.10'}
seed Skill, {description: 'Recognize and draw shapes having specified attributes, such as a given number of angles or a given number of equal faces. Identify triangles, quadrilaterals, pentagons, hexagons, and cubes. Sizes are compared directly or visually, not compared by measuring.', grade: 2, domain: Domain.fourth, course: Course.first}, {title: 'CCSS.Math.Content.2.G.A.1'}
seed Skill, {description: 'Partition a rectangle into rows and columns of same-size squares and count to find the total number of them.', grade: 2, domain: Domain.fourth, course: Course.first}, {title: 'CCSS.Math.Content.2.G.A.2'}
seed Skill, {description: 'Partition circles and rectangles into two, three, or four equal shares, describe the shares using the words halves, thirds, half of, a third of, etc., and describe the whole as two halves, three thirds, four fourths. Recognize that equal shares of identical wholes need not have the same shape.', grade: 2, domain: Domain.fourth, course: Course.first}, {title: 'CCSS.Math.Content.2.G.A.3'}


seed Skill, {title: 'CCSS.MATH.CONTENT.3.OA.A.1', description: 'Interpret products of whole numbers, e.g., interpret 5 × 7 as the total number of objects in 5 groups of 7 objects each. For example, describe a context in which a total number of objects can be expressed as 5 × 7.', grade: 3, domain: Domain.first, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.OA.A.2', description: 'Interpret whole-number quotients of whole numbers, e.g., interpret 56 ÷ 8 as the number of objects in each share when 56 objects are partitioned equally into 8 shares, or as a number of shares when 56 objects are partitioned into equal shares of 8 objects each. For example, describe a context in which a number of shares or a number of groups can be expressed as 56 ÷ 8.', grade: 3, domain: Domain.first, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.OA.A.3', description: 'Use multiplication and division within 100 to solve word problems in situations involving equal groups, arrays, and measurement quantities, e.g., by using drawings and equations with a symbol for the unknown number to represent the problem.', grade: 3, domain: Domain.first, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.OA.A.4', description: 'Determine the unknown whole number in a multiplication or division equation relating three whole numbers. For example, determine the unknown number that makes the equation true in each of the equations 8 × ? = 48, 5 = _ ÷ 3, 6 × 6 = ?', grade: 3, domain: Domain.first, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.OA.B.5', description: 'Apply properties of operations as strategies to multiply and divide.2 Examples: If 6 × 4 = 24 is known, then 4 × 6 = 24 is also known. (Commutative property of multiplication.) 3 × 5 × 2 can be found by 3 × 5 = 15, then 15 × 2 = 30, or by 5 × 2 = 10, then 3 × 10 = 30. (Associative property of multiplication.) Knowing that 8 × 5 = 40 and 8 × 2 = 16, one can find 8 × 7 as 8 × (5 + 2) = (8 × 5) + (8 × 2) = 40 + 16 = 56. (Distributive property.)', grade: 3, domain: Domain.first, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.OA.B.6', description: 'Understand division as an unknown-factor problem. For example, find 32 ÷ 8 by finding the number that makes 32 when multiplied by 8.', grade: 3, domain: Domain.first, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.OA.C.7', description: 'Fluently multiply and divide within 100, using strategies such as the relationship between multiplication and division (e.g., knowing that 8 × 5 = 40, one knows 40 ÷ 5 = 8) or properties of operations. By the end of Grade 3, know from memory all products of two one-digit numbers.', grade: 3, domain: Domain.first, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.OA.D.8', description: 'Solve two-step word problems using the four operations. Represent these problems using equations with a letter standing for the unknown quantity. Assess the reasonableness of answers using mental computation and estimation strategies including rounding.', grade: 3, domain: Domain.first, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.OA.D.9', description: 'Identify arithmetic patterns (including patterns in the addition table or multiplication table), and explain them using properties of operations. For example, observe that 4 times a number is always even, and explain why 4 times a number can be decomposed into two equal addends.', grade: 3, domain: Domain.first, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.NBT.A.1', description: 'Use place value understanding to round whole numbers to the nearest 10 or 100.', grade: 3, domain: Domain.second, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.NBT.A.2', description: 'Fluently add and subtract within 1000 using strategies and algorithms based on place value, properties of operations, and/or the relationship between addition and subtraction.', grade: 3, domain: Domain.second, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.NBT.A.3', description: 'Multiply one-digit whole numbers by multiples of 10 in the range 10-90 (e.g., 9 × 80, 5 × 60) using strategies based on place value and properties of operations.', grade: 3, domain: Domain.second, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.NF.A.1', description: 'Understand a fraction 1/b as the quantity formed by 1 part when a whole is partitioned into b equal parts; understand a fraction a/b as the quantity formed by a parts of size 1/b.', grade: 3, domain: Domain.third, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.NF.A.2', description: 'Understand a fraction as a number on the number line; represent fractions on a number line diagram.', grade: 3, domain: Domain.third, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.NF.A.3', description: 'Explain equivalence of fractions in special cases, and compare fractions by reasoning about their size.', grade: 3, domain: Domain.third, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.MD.A.1', description: 'Tell and write time to the nearest minute and measure time intervals in minutes. Solve word problems involving addition and subtraction of time intervals in minutes, e.g., by representing the problem on a number line diagram.', grade: 3, domain: Domain.fourth, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.MD.A.2', description: 'Measure and estimate liquid volumes and masses of objects using standard units of grams (g), kilograms (kg), and liters (l). Add, subtract, multiply, or divide to solve one-step word problems involving masses or volumes that are given in the same units, e.g., by using drawings (such as a beaker with a measurement scale) to represent the problem.', grade: 3, domain: Domain.fourth, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.MD.B.3', description: 'Draw a scaled picture graph and a scaled bar graph to represent a data set with several categories. Solve one- and two-step "how many more" and "how many less" problems using information presented in scaled bar graphs. For example, draw a bar graph in which each square in the bar graph might represent 5 pets.', grade: 3, domain: Domain.fourth, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.MD.B.4', description: 'Generate measurement data by measuring lengths using rulers marked with halves and fourths of an inch. Show the data by making a line plot, where the horizontal scale is marked off in appropriate units— whole numbers, halves, or quarters.', grade: 3, domain: Domain.fourth, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.MD.C.5', description: 'Recognize area as an attribute of plane figures and understand concepts of area measurement.', grade: 3, domain: Domain.fourth, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.MD.C.6', description: 'Measure areas by counting unit squares (square cm, square m, square in, square ft, and improvised units).', grade: 3, domain: Domain.fourth, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.MD.C.7', description: 'Relate area to the operations of multiplication and addition.', grade: 3, domain: Domain.fourth, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.MD.C.8', description: 'Solve real world and mathematical problems involving perimeters of polygons, including finding the perimeter given the side lengths, finding an unknown side length, and exhibiting rectangles with the same perimeter and different areas or with the same area and different perimeters.', grade: 3, domain: Domain.fourth, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.G.A.1', description: 'Understand that shapes in different categories (e.g., rhombuses, rectangles, and others) may share attributes (e.g., having four sides), and that the shared attributes can define a larger category (e.g., quadrilaterals). Recognize rhombuses, rectangles, and squares as examples of quadrilaterals, and draw examples of quadrilaterals that do not belong to any of these subcategories.', grade: 3, domain: Domain.fifth, course: Course.first}
seed Skill, {title: 'CCSS.MATH.CONTENT.3.G.A.2', description: 'Partition shapes into parts with equal areas. Express the area of each part as a unit fraction of the whole. For example, partition a shape into 4 parts with equal area, and describe the area of each part as 1/4 of the area of the shape.', grade: 3, domain: Domain.fifth, course: Course.first}


game1 = seed Game, {title: 'Maths Man'}, {redirect_uri: 'urn:ietf:wg:oauth:2.0:oob'}
seed GameSkill, {game_id: game1.id, skill_id: skill1.id}

game2 = seed Game, {title: 'Maths Man 2'}, {redirect_uri: 'urn:ietf:wg:oauth:2.0:oob'}
seed GameSkill, {game_id: game2.id, skill_id: skill1.id}

game3 = seed Game, {title: 'Build a tower'}, {redirect_uri: 'urn:ietf:wg:oauth:2.0:oob'}
seed GameSkill, {game_id: game3.id, skill_id: skill2.id}

game4 = seed Game, {title: 'Build a tower 2'}, {redirect_uri: 'urn:ietf:wg:oauth:2.0:oob'}
seed GameSkill, {game_id: game4.id, skill_id: skill2.id}

seed CompletedStudentSkill, {student_id: student1.id, skill_id: skill1.id, collected: false}
seed CompletedStudentSkill, {student_id: student1.id, skill_id: skill2.id, collected: true}
seed CompletedStudentSkill, {student_id: student2.id, skill_id: skill2.id, collected: true}

#!/usr/bin/env sh
#john morris beck 2025 - gplv2 - see gnu.org for license - https://github.com/memesmith0 - https://thefastscrolls.neocities.org
#qlfc7.sh
#quick_learn_field_code_7
#this is a compiler for quick-learn-field-language version 7

#currently i need to rewrite the description from version 1 to match the new design. the description from version 1 should give you an idea of how this works.
#but bear in mind this system will be much closer to true s expressions and will be run entirely with c instead of awk, and requires administrator to install
#onto a computer unless one uses a c compiler to compile it to something like awk or basic or some ibm language already on the machine. the following
#is the description of the version 1 of this language.

#this program is intended to simplify the amount of effort it takes to teach a 14 year old or older highschool student to do math at arbitrary levels.
#for highschool students and for military recruits this language is intined to put "horse blinders" on math preventing them and their superiors from
#having to learn super advanced notations and maths in order to do mathematical or coding tasks of arbitrary complexity
#in its curent design it is intended to be paired with a second program that prevents the user from using "illegal syntax"
#this "illegal syntax" might be useful to an advanced user: however to most users of this language that notation is a complex heading. removing
#that complicated mumbjo jumbo code notation is the entire reaosn why this language exists - to put horse blinders on math so students, military personnel,
#and workers can learn to do maths at arbitrary levels of complexity with minimal training and learning. this langauge is along the evolutionary path
#of languages that is intended to be taught in math textbooks alongside ordinary math to explain in a crystal clear fashion what the bizarre noations
#in those books without having to rely on imprecise verbal descriptions. this language should be compatible with nearly all computer systems going back as far
#as 1980s unix systems or earlier. it is incredibly concise on purpose to make it easy to transfer onto an existing machine by hand, and to make it difficult
#for a lawyer to claim that any one company could have sole copyright over such a small piece of code. included with this language will be a set of functions
#for generating a much faster type of code called c code. in the military and in the industry c code is generally considered the fastest language. that being said,
#this extension of the quick-learn-field-code language that generates c code is not intended for beginners, but only advanced users of the language. beginners who
#try to use that extension will likely write faulty code that could break the functionality of a computer, which could prevent that computer from successfully
#completing the mission it was intended to aid. as a final reminder- removing the filter that prevents illegal syntax is counterproductive to the point of the
#design of this language. if the user, say a student or a military personnel, wants to use that extended syntax, they should be instructed to use regular awk,
#and not this system, and they are likely a more advanced user. the code that they generate in awk will not likely be readable to their superior, like this.
#furthermore, in this language the ordinary awk command is accessable through a function called system().

#this code is not yet audited to the highest boeing aeronautical do audit. therefore it is not yet suited for certain academic
#industrial, or military purposes. that being said future versions are intended to be auditable when the design is completed
#for now it is a working prototype for what it is intended for. because the final code will be such a small amount of code
#and because awk is already audited to those standards to be guaranteed memory safe, the cost of performing this audit
#to aeronautical miiltary stanards should be very low compared to most military systems, especialy because when it is completed
#very few changes should have to be made to the system ever again unless unnecessary features are requested.


#the main next thing that i need to do is test strings to make sure they format correctly
#also to see what im gonna do about unicode strings
#maybe add a line to test for non allowed characters in the language

#then i need to write my c compiler
#then test the compiler

#then i need to write my javascript compiler
#then text my javascript compiler

#and finally i need to try to host this thing in wasm and make it the master system and make
#javascrip the worker system, and make javascript control the entire document object model including html and css
#without having to type much html and css to get that going.

#and i guess i need to verify this is truly posix compilant with both busybox and bash posix mod
#and i guess the absolute final thing would be to test for protablity for c and javscript with various
#c and javascript compilers.

#and of course i have to test it myself and decide "is this easy." "is this worth using over python." is surely
#hope so for the sake of my own schedule for the next few months/years.
awk '
function next_operation_code( ){
    
while( memory[ "call_stack" "call_stack_index" ] ){
    
if( memory[ "call_stack" memory[ "call_stack" "call_stack_index" ] memory[ "call_stack" "subroutine_index" ] ){
	
	return memory[ "call_stack" memory[ "call_stack" "call_stack_index" ]++ memory[ "call_stack" "subroutine_index" ] ] ;
	
    }
    
memory[ "call_stack" "call_stack_index" ] = 0 ;
    
memory[ "call_stack" memory[ "call_stack" "call_stack_index" ]-- memory[ "call_stack" "subroutine_index" ] ] = 0 ;
    
}
    
memory[ "call_stack" "call_stack_index" ]++ ;

getline line ;

split( line , line , " " ) ;

for( line_index = 1 ; line[ line_index ] ; memory[ "call_stack" "call_stack_index" line_index ] = line[ line_index++ ] ){

    
    
}

}

{

    operand_a = next_operation_code( ) ;
    
    operan_b = next_operation_code( ) ;
    
    operand_c = next_operation_code( ) ;
    
    operator = next_operation_code( ) ;
    
    if( operator == "add" ){
	
	memory[ operand_a ] = memory[ operand_b ] + memory[ operand_c ] ;
	
    }
    else if(operator== "sub" ){
	
	memory[ operand_a ] = memory[ operand_b ] - memory[ operand_c ] ;

    }
    else if( operator == "mult" ){
    
    memory[ operand_a ] = memory[ operand_b ] * memory[ operand_c ] ;

    }
    else if( operator == "div" ){

	memory[ operand_a ] = int( memory[ operand_b ] / memory[ operand_c ] ) ;

    }
    else if( operator == "mod" ){

	memory[ operand_a ] = memory[ operand_b ] % memory[ operand_c ] ;

    }
    else if( operator == "or" ){

	memory[ operand_a ] = memory[ operand_b ] || memory[ operand_c ] ;

    }
    else if( operator == "less" ){

	memory[ operand_a ] = memory[ operand_b ] < memory[ operand_c ] ;

    }
    else if( operator == "move" ){

	memory[ operand_a ] = memory[ operand_b ] ;

    }
    else if( operator == "store" ){

	memory[ operand_a ] = operand_b;

    }
    else if( operator == "shell" ){

	memory[ operand_a ] = system( memory[ operand_b ] ) ;

    }
    else if( operator == "get" ){

	memory[ operand_a ] = memory[memory[ operand_b ]] ;

    }
    else if( operator == "set" ){

	memory[memory[ operand_a ] ] = memory[ operand_b ] ;

    }
    else if( operator == "read" ){
	
	getline memory[ operand_a ] ;

    }
    else if( operator == "write" ){

	printf "%s", memory[ operand_a ] ;

    }
    else if( operator == "append" ){

	memory[ operand_a ] = memory[ operand_b ] memory[ operand_c ] ;

    }
    else if( operator == "int_to_char" ){

	memory[ operand_a ] = sprintf( "%c" , memory[ operand_b ] ) ;

    }
    else if( operator == "char_to_int" ){

	memory[ operand_a ] = ord( memory[ operand_b ] ) ;

    }
    else if( operator == "substring" ){

	memory[ operand_a ] = substr( memory[ operand_a ],memory[ operand_b ],memory[ operand_c ] ) ;

    }
    else if( operator == "run" ){

	memory[ "call_stack" memory[ "call_stack" "call_stack_index" ]++ ] = memory[ operand_a ] ;

    }
    
    else{

	exit;

    }
    
}
';

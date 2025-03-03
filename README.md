# Mastermind Game in Ruby

This is a command-line Mastermind game written in Ruby. The game allows you to guess a secret code based on a series of feedback hints. The objective is to guess the code correctly in a limited number of attempts.

## Features

- The secret code consists of a sequence of 4 numbers, each between 1 and 6.
- You have up to 12 attempts to guess the code.
- After each guess, you will receive a hint indicating:
  - "match" for correct number and position.
  - "misplaced" for correct number, wrong position.
  - "absent" for numbers not in the code.
- You can type 'x' to go back to a previous guess or 'e' to exit the game at any time.
- User-friendly prompts for entering guesses.
- Colorized output for better visual feedback using the `colorize` gem.

## Requirements

To run this project, you need to have Ruby installed on your machine. You can check if Ruby is installed by running the following command in your terminal:

```bash
ruby -v
```

## Installation

1. Clone the repository to your local machine:

```bash
git clone https://github.com/RicardoPriv/Mastermind.git
cd Mastermind
```

2. Install dependencies:

```bash
bundle install
```

3. Run the game:

```bash
ruby ./main.rb
```

The game will prompt you to enter your guesses one at a time. After each guess, it will show you hints in the form of colorized feedback.

## How the Game Works

- The secret code consists of 4 digits, each between 1 and 6.
- After each guess, you will receive a hint with the following possibilities:
  - "match" - the digit is in the correct position.
  - "misplaced" - the digit is in the code but not in the correct position.
  - "absent" - the digit is not in the code at all.
- The game ends either when you guess the code correctly or when you reach the maximum number of attempts (12).
- You can type 'x' to go back and fix a previous guess or 'e' to exit the game at any time.

## Example

Here's an example of how the game prompts you for input and displays the hints:

```
Enter in guess for position 1: 4
Enter in guess for position 2: 2
Enter in guess for position 3: 3
Enter in guess for position 4: 1

User guessed: | 4 | 2 | 3 | 1 |
Hint provided: | match | match | misplaced | absent |
```

## Game Flow

1. The game generates a random secret code.
2. You are prompted to enter your guess for each position (1 to 4).
3. After each guess, the game provides feedback in the form of "match", "misplaced", or "absent".
4. If you guess the code correctly, the game ends with a win message.
5. If you reach the maximum number of attempts (12) without guessing the code, you lose.

## Files

- **main.rb**: The main entry point of the game that starts the gameplay loop.
- **password.rb**: Contains the `Password` class that generates and stores the secret code.
- **guess.rb**: Contains the `Guess` class to handle the user's guesses and provide feedback (hints).
- **colour.rb**: Contains helper methods to colorize the output for better visibility and user experience.
- **Gemfile**: Specifies the dependencies required for the project.
- **Gemfile.lock**: Stores the exact versions of the installed gems to ensure consistency.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    [SerializeField] private int startingLives = 3;
    public int lives;
    public int score = 0;
    public GameObject bumper1;
    public GameObject bumper2;
    public int bricksRemaining;
    [SerializeField] private bool win;
    public Canvas gameplayUI;
    public Canvas endGameUI;
    public TextMeshProUGUI victoryText;
    public TextMeshProUGUI finalScoreText;
    public Image endGameMenuBG;

    public static float timeScaleNumber = 1;

    //end screen buttons
    public TextMeshProUGUI replayButtonText;


    //initialize TM Pro labels
    public TextMeshProUGUI scoreLabel;
    public TextMeshProUGUI livesLabel;

    // Start is called before the first frame update
    void Start()
    {
        score = 0;
        lives = startingLives;
        bricksRemaining = 32;
        setUI();
        Time.timeScale = 1; ;

    }

    // Update is called once per frame
    void Update()
    {
        //Debug.Log(Time.deltaTime);

        setUI();

        if(lives == 0)
        {
            win = false;
            gameOver();
        }

    }

    //Update the UI to the current score and lives ammounts
    public void setUI()
    {
        scoreLabel.text = "Score: " + score.ToString();
        livesLabel.text = "Lives: " + lives.ToString();
    }

    //Ball will cal this when it collides with a brick
    public void addScore()
    {
        score += 10;
        setUI();
    }

    public void brickDestroyed()
    {
        if(bricksRemaining > 1)
        {
            bricksRemaining--;
        } else
        {
            win = true;
            gameOver();
        }
        
    }

    //End of game
    void gameOver()
    {
        timeScaleNumber = 0;
        Time.timeScale = timeScaleNumber;
        //endGameUI.GetComponent<Canvas>().enabled = true;
        endGameUI.gameObject.SetActive(true);

        //Handle victory text
        if (win)
        {
            victoryText.text = "VICTORY";
        } else
        {
            victoryText.text = "DEFEAT";
            endGameMenuBG.color = new Color(33 / 250, 128 / 250, 107 / 250);
        }

        finalScoreText.text = "Score: " + score;

        gameplayUI.enabled = false;
        

        //Set button labels for end screen

    }

    public void mainMenuClicked()
    {
        Debug.Log("Main Menu Pressed");
    }

    public void replayClicked()
    {
        Debug.Log("Replay Pressed");
        timeScaleNumber = 1;
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        
    }
}

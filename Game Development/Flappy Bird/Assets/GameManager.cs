using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

public class GameManager : MonoBehaviour
{
    public GameObject gameOverCanvas;
    public GameObject bird;
    public GameObject scoreCanvas;
    public TextMeshProUGUI finalScore;


    private void Start()
    {
        Time.timeScale = 1;
    }


    public void gameOver()
    {
        scoreCanvas.SetActive(false);
        gameOverCanvas.SetActive(true);
        Time.timeScale = 0;
        finalScore.text = "Score: " + Score.score.ToString();

        
        
    }

    public void newGame()
    {
        SceneManager.LoadScene(0);
    }
}

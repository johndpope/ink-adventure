using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class NewScript : MonoBehaviour {

    public int State;
    public Text stateText;
    public GameObject map;
    public GameObject text;
    private bool hideShow = true;

	// Use this for initialization
	void Start () {
        Debug.Log(State);
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    public void incrementRation()
    {
        State += 5;
        stateText.text = State.ToString();
    }

    public void hideShowMap()
    {
        hideShow = !hideShow;
        Debug.Log("Hiding and Showing" + hideShow);
        text.SetActive(hideShow);
    }
}

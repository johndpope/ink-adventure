using UnityEngine;
using System.Collections;
using Ink.Runtime;
using UnityEngine.UI;
using System.IO;

public class Script : MonoBehaviour {
	[SerializeField]
	private TextAsset inkAsset;
	private Story _inkStory;
	private bool storyNeeded;
    public Texture2D texture;

    public GameObject character;
    [SerializeField]
	private Canvas canvas;
	[SerializeField]
	private float elementPadding;

	/* UI Prefabs */
	[SerializeField]
	private GameObject text;
	[SerializeField]
	private UnityEngine.UI.Button button;


	void Awake () {
		_inkStory = new Story (inkAsset.text);
		storyNeeded = true;
    }

    void loadImage(string imageName)
    {

        character.GetComponent<Image>().sprite = Resources.Load<Sprite>(imageName);
        character.GetComponent<Image>().preserveAspect = true;
    }

    GameObject storyText;
    string newValue;
    // Update is called once per frame
    void variableObserver(string varName, object newValue)
    {

    }
    void Update () {
		if (storyNeeded == true) {
			RemoveChildren ();

			float offset = 0;
			while (_inkStory.canContinue) {
				storyText = Instantiate (text);
                storyText.name = "Scroll View";
                _inkStory.ObserveVariable("Char_Image", (string varName, object newValue) => {
                    loadImage((string)newValue);
                });
                storyText.GetComponentInChildren<UnityEngine.UI.Text>().text = _inkStory.ContinueMaximally ();
				storyText.transform.SetParent (canvas.transform, false);
                storyText.transform.SetSiblingIndex(1);
			}
            
			if(_inkStory.currentChoices.Count > 0) {
				for (int ii = 0; ii < _inkStory.currentChoices.Count; ++ii) {

					UnityEngine.UI.Button choice = Instantiate (button) as UnityEngine.UI.Button;
					choice.transform.SetParent (storyText.GetComponentInChildren<Text>().gameObject.transform.parent, false);

					choice.transform.Translate (new Vector2 (0, offset));

					UnityEngine.UI.Text choiceText = choice.GetComponentInChildren<UnityEngine.UI.Text> ();
					choiceText.text = _inkStory.currentChoices [ii].text;

					UnityEngine.UI.HorizontalLayoutGroup layoutGroup = choice.GetComponent <UnityEngine.UI.HorizontalLayoutGroup> ();

					int choiceId = ii;
					choice.onClick.AddListener(delegate{ChoiceSelected(choiceId);});

					offset -= (choiceText.fontSize + layoutGroup.padding.top + layoutGroup.padding.bottom + elementPadding);
				}
			}
            
			storyNeeded = false;
		}
	}

	void RemoveChildren () {
		int childCount = canvas.transform.childCount;
		for (int i = childCount - 1; i >= 0; --i) {
            if (canvas.transform.GetChild(i).name == "Scroll View")
            {
                GameObject.Destroy(canvas.transform.GetChild(i).gameObject);
            }
        }
	}

	public void ChoiceSelected (int id) {
		_inkStory.ChooseChoiceIndex (id);
		storyNeeded = true;
	}
}

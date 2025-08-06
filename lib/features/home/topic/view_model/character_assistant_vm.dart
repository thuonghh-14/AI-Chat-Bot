import 'package:flutter/foundation.dart';
import '../models/character_assistant_model.dart';
import 'dart:convert';

class CharacterAssistantViewModel extends ChangeNotifier {
  List<CharacterAssistant> _characters = [];
  final int _pageSize = 15;
  int _currentMax = 15;

  List<CharacterAssistant> get characters => _characters;

  CharacterAssistantViewModel() {
    loadCharacters();
  }

  List<CharacterAssistant> get visibleCharacters => _characters.take(_currentMax).toList();

  void loadCharacters() {
    final jsonData = '''
    {
  "characters": [
    {
      "id": 1,
      "description": "Theoretical \\nPhysicist",
      "name": "Albert Einstein",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 2,
      "description": "Content Creator",
      "name": "Mr. Beast",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 3,
      "description": "CEOs",
      "name": "Elon Musk",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": false
    },
    {
      "id": 4,
      "description": "The Blonde \\nBombshell",
      "name": "Marilyn Monroe",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": false
    },
    {
      "id": 6,
      "description": "Microsoft's \\nco-founder",
      "name": "Bill Gates",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 7,
      "description": "Facebook's \\nco-founder",
      "name": "Mark Zuckerberg",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": false
    },
    {
      "id": 8,
      "description": "Financial \\ninvestment",
      "name": "Warren Buffett",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 9,
      "description": "Information \\nTechnology",
      "name": "Sam Altman (CEO OpenAI)",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": false
    },
    {
      "id": 10,
      "description": "E-commerce \\nexpert",
      "name": "Jeff Bezos",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 11,
      "description": "Financial \\nManagement",
      "name": "Jack Ma",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 12,
      "description": "Affiliate \\nMarketing",
      "name": "William J. Tobin",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": false
    },
    {
      "id": 13,
      "description": "Artist",
      "name": "Billie Eilish",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": false
    },
    {
      "id": 14,
      "description": "Bard of Avon",
      "name": "William Shakespeare",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 15,
      "description": "Health \\nProfessional",
      "name": "Psychologist",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 16,
      "description": "Freelance \\nAdvisor",
      "name": "Seth Godin",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": false
    },
    {
      "id": 17,
      "description": "Chat GPT 4.0",
      "name": "",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": false
    },
    {
      "id": 18,
      "description": "Gemini Pro",
      "name": "",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 19,
      "description": "Claude",
      "name": "",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    },
    {
      "id": 20,
      "description": "DeepSeek R1",
      "name": "",
      "iconUrl": "",
      "bgImageUrl": "",
      "premiumActive": true
    }
  ]
}
    ''';

    final Map<String, dynamic> parsedJson = json.decode(jsonData);
    final List<dynamic> characterJsonList = parsedJson['characters'];

    _characters = characterJsonList.map((json) => CharacterAssistant.fromJson(json)).toList();

    notifyListeners();
  }

  void loadMore() {
    if (_currentMax < _characters.length) {
      _currentMax += _pageSize;
      notifyListeners();
    }
  }

  bool get hasMore => _currentMax < _characters.length;
}

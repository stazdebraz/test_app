// Project imports:
import '../../../domain/repo/credits_list_repo.dart';
import '../../model/credit_list_model.dart';

class CreditsListRepoImp implements CreditsListRepo{
  Map<String,dynamic> data = {
    "credits": [
        {
            "credit_id": 1,
            "description": "Personal loans are given to meet the particular needs of the group and individual. For example, personal loans are taken to purchase consumer goods, electronics, houses, vehicles, etc.",
            "type": "Loan for Personal Purpose"
        },
        {
            "credit_id": 2,
            "description": "These loans are offered to meet the needs of the business. It can be a working capital loan or cash credit facility to meet a short-term liquidity crunch. ",
            "type": "Loan for Business or Profession Purposes"
        },
        {
            "credit_id": 3,
            "description": "Personal loans are given to meet the particular needs of the group and individual. For example, personal loans are taken to purchase consumer goods, electronics, houses, vehicles, etc.",
            "type": "Loan for Personal Purpose"
        },
        {
            "credit_id": 4,
            "description": "Personal loans are given to meet the particular needs of the group and individual. For example, personal loans are taken to purchase consumer goods, electronics, houses, vehicles, etc.",
            "type": "Loan for Personal Purpose"
        },
        {
            "credit_id": 5,
            "description": "These loans are offered to meet the needs of the business. It can be a working capital loan or cash credit facility to meet a short-term liquidity crunch. ",
            "type": "Loan for Business or Profession Purposes"
        },
        {
            "credit_id": 6,
            "description": "Personal loans are given to meet the particular needs of the group and individual. For example, personal loans are taken to purchase consumer goods, electronics, houses, vehicles, etc.",
            "type": "Loan for Personal Purpose"
        },
        {
            "credit_id": 7,
            "description": "Personal loans are given to meet the particular needs of the group and individual. For example, personal loans are taken to purchase consumer goods, electronics, houses, vehicles, etc.",
            "type": "Loan for Personal Purpose"
        },
        {
            "credit_id": 8,
            "description": "These loans are offered to meet the needs of the business. It can be a working capital loan or cash credit facility to meet a short-term liquidity crunch. ",
            "type": "Loan for Business or Profession Purposes"
        },
        {
            "credit_id": 9,
            "description": "Personal loans are given to meet the particular needs of the group and individual. For example, personal loans are taken to purchase consumer goods, electronics, houses, vehicles, etc.",
            "type": "Loan for Personal Purpose"
        }
    ]
};
  @override
  getCreditsList() async{
    final CreditsListModel model = CreditsListModel.fromJson(data);
    return model;
  }
}

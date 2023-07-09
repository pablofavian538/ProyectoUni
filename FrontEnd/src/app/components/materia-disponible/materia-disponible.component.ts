import { Component, Input, OnInit } from '@angular/core';
import { IEstudiante } from 'src/app/interface/iestudiante';
import { IMateria } from 'src/app/interface/imateria';
import { EstudianteService } from 'src/app/services/estudiante.service';

@Component({
  selector: 'app-materia-disponible',
  templateUrl: './materia-disponible.component.html',
  styleUrls: ['./materia-disponible.component.scss'],
})
export class MateriaDisponibleComponent implements OnInit {
  @Input() idEstudiante?: number;
  @Input() idUsuario!: number;
  @Input() rol?: string;
  materiasDispnibles: IMateria[] = [];
  constructor(private _estudianteService: EstudianteService) {}

  ngOnInit() {
    const user = JSON.parse(localStorage.getItem('usuario')!);
    if (user.rol == 'usuario') {
      this._estudianteService
        .getEstudianteById(user.idUsuario)
        .subscribe((resp) => {
          this._estudianteService
            .getEstudianteMaterias(resp.idEstudiante!)
            .subscribe((resp) => {
              const list = JSON.stringify(resp);
              const listMateria: IMateria[] = JSON.parse(list);
              listMateria.forEach((e) => {
                if (e.status == 'disponible') {
                  this.materiasDispnibles.push(e);
                }
              });
            });
        });
    }
  }
}
